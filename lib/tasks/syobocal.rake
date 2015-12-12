namespace :syobocal do
  desc "しょぼいカレンダーAPIを実行し、DBにデータを格納する"

  task :import => :environment do
    
    require 'common_util.rb'

    # ログファイル指定
    logger = ActiveSupport::Logger.new(Rails.root.join("log/batch.log"), "daily")
    
    #param = {'TID' => 2077}
    #param = {'LastUpdate' => '20150901_000000-'}
    started_on  = (Date.today - 5.days).strftime('%Y%m%d')
    ended_on    = (Date.today + 5.days).strftime('%Y%m%d')
    range       = "#{started_on}_000000-#{ended_on}_235959"    
    param = {}
    #param = {:TID => 1496,:Range => range}
    param["TID"] = 1453
    param["range"] = range


    result = Syobocal::DB::TitleLookup.get(param)
      
    result.each do |r_title|
      animeTitle = AnimeTitle.new
      animeTitle.tid = r_title[:tid]
      animeTitle.title = r_title[:title]
      animeTitle.short_title = r_title[:short_title]
      animeTitle.title_yomi = r_title[:title_yomi]
      animeTitle.title_en = r_title[:title_en]
      animeTitle.cat = r_title[:cat]
      animeTitle.title_flag = r_title[:title_flag]
      animeTitle.first_year = r_title[:first_year]
      animeTitle.first_month = r_title[:first_month]
      animeTitle.first_end_year = r_title[:first_end_year]
      animeTitle.first_end_month = r_title[:first_end_month]
      animeTitle.first_chid = r_title[:first_ch]
      animeTitle.keywords = r_title[:keywords]
      animeTitle.user_point = r_title[:user_point]
      animeTitle.user_point_rank = r_title[:user_point_rank]
      animeTitle.comment = r_title[:comment]
      comment = r_title[:comment]
      hash = {}
      lishHash = Hash.new
      commentType = ''
      comment.each_line do |line|
        case line.chomp[0,1]
          when "*"
            case line.chomp
              when "*リンク" then
                commentType = CommentType::LINK
              when "*スタッフ" then
                commentType = CommentType::STAFF
              when "*キャスト" then
                commentType = CommentType::CAST
              when "*オープニング" then
                commentType = CommentType::OPENING
              when "*エンディング" then
                commentType = CommentType::ENDING
              else
                commentType = nil
            end
            commentList = Array.new;
            hash = {}
          else
          array = line.chomp.split(":")
          if array.size <= 2 then next end
          if commentType == CommentType::STAFF then
            staffRollName = array[1]
            staffNameDef = array[2]
            #logger.info(" staffRoll:" + staffRollName + " staffName:" + staffNameDef)
             
            # スタッフ名登録 
            animeStaff = AnimeStaff.new
            staffList = CommonUtil.splitData(CommonUtil.removeOption(staffNameDef))
            staffList.each do |staffName|
              staffId = animeStaff.saveStaff(staffName)            
  
              # スタッフ役職登録
              animeStaffRoll = AnimeStaffRoll.new
              staffRollId = animeStaffRoll.saveStaffRoll(staffRollName)

              # スタッフ関係登録
              staffRelate = AnimeStaffRelate.new
              staffRelate.tid = animeTitle.tid
              staffRelate.staff_id = staffId
              staffRelate.staff_roll_id = staffRollId
              result = AnimeStaffRelate.where(tid:animeTitle.tid, staff_id: staffId, staff_roll_id: staffRollId)
              if result.empty? then
                staffRelate.save
              end
            end
          end
        end
      end
      # サブタイトル
      subTitleData = r_title[:sub_titles]
      unless subTitleData.nil? then
        subTitleList = subTitleData.split("\n")
        subTitleList.each do |subTitle|
          animeSubTitle = AnimeSubTitle.new
          stMatchResult = subTitle.match(/\*(.{2,2})\*(.*)/)
          unless stMatchResult.nil? then
            animeSubTitle.tid = animeTitle.tid
            animeSubTitle.story = stMatchResult[1]
            animeSubTitle.sub_title = stMatchResult[2]
            animeSubTitle.save
            logger.info("アニメサブタイトルを追加しました[tid=#{animeSubTitle.tid}]")
          end
        end
      end
#      animeTitleList.push(animeTitle)
      animeTitleResult = AnimeTitle.where(tid:animeTitle.tid)
      if animeTitleResult.empty? then
        animeTitle.save
        logger.info("アニメタイトルを追加しました[tid=#{animeTitle.tid}]")
      end
    end
  end

  module CommentType
    LINK = 1,
    STAFF = 2,
    CAST = 3,
    OPENING = 4,
    ENDING = 5
  end
end
