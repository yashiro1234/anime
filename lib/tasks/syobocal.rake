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
    param["TID"] = 3890
    param["range"] = range


    result = Syobocal::DB::TitleLookup.get(param)
      
    result.each do |r_title|
      animeTitle = Title.new
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
            animeStaff = Staff.new
            staffList = CommonUtil.splitData(CommonUtil.removeOption(staffNameDef))
            staffList.each do |staffName|
              staffId = animeStaff.saveStaff(staffName)            
  
              # スタッフ役職登録
              animeStaffRoll = StaffRoll.new
              staffRollId = animeStaffRoll.saveStaffRoll(staffRollName)

              # スタッフ関係登録
              staffRelate = StaffRelate.new
              staffRelate.tid = animeTitle.tid
              staffRelate.staff_id = staffId
              staffRelate.staff_roll_id = staffRollId
              result = StaffRelate.where(tid:animeTitle.tid, staff_id: staffId, staff_roll_id: staffRollId)
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
          animeSubTitle = SubTitle.new
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
      animeTitleResult = Title.where(tid:animeTitle.tid)
      if animeTitleResult.empty? then
        animeTitle.save
        logger.info("アニメタイトルを追加しました[tid=#{animeTitle.tid}]")
      end
    end
  end

  task :program => :environment do
    param = {'TID' => 3890}
    #param = {'LastUpdate' => '20150901_000000-'}
    result = Syobocal::DB::ProgLookup.get(param)

    result.each do |r_program|
      program = Program.new
      program.pid = r_program[:pid]
      program.tid = r_program[:tid]
      program.st_time = r_program[:st_time]
      program.st_offset = r_program[:st_offset]
      program.ed_time = r_program[:ed_time]
      program.story = r_program[:count]
      program.sub_title = r_program[:sub_title]
      program.prog_comment = r_program[:prog_comment]
      program.flag = r_program[:flag]
      program.deleted = r_program[:deleted]
      program.warn = r_program[:warn]
      program.ch_id = r_program[:ch_id]
      program.revision = r_program[:revision]
      program.save
    end
  end

  task :channel => :environment do
    param = {'ChID' => '*'}
    result = Syobocal::DB::ChLookup.get(param)
    result.each do |r_channel|
      channel = Channel.new
      channel.ch_id = r_channel[:ch_id]
      channel.ch_name = r_channel[:ch_name]
      channel.ch_epgname = r_channel[:chi_epgname]
      channel.ch_url = r_channel[:ch_url]
      channel.ch_epgurl = r_channel[:ch_epgurl]
      channel.ch_comment = r_channel[:ch_comment]
      channel.ch_gid = r_channel[:ch_gid]
      channel.ch_number = r_channel[:ch_number]
      channel.save
    end
  end

  task :channelGroup => :environment do
    param = {'ChGID' => '*'}
    result = Syobocal::DB::ChGroupLookup.get(param)
    result.each do |r_channelGroup|
      channelGroup = ChannelGroup.new
      channelGroup.ch_gid = r_channelGroup[:ch_gid]
      channelGroup.ch_group_name = r_channelGroup[:ch_group_name]
      channelGroup.ch_group_comment = r_channelGroup[:ch_group_comment]
      channelGroup.ch_group_order = r_channelGroup[:ch_group_order]
      channelGroup.save
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
