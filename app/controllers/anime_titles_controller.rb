class AnimeTitlesController < ApplicationController

#  private

#    def anime_title_params
#      params.require(:anime_title).permit(:tid, :title, :short_title, :title_yomi, :title_en, :comment, :cat, :title_flag, :first_year, :first_month, :first_end_year, :first_end_month, :first_chid, :keywords, :user_point, :user_point_rank, :last_update)
#    end

  public
    def index
      param = {'TID' => 2077}
      result = Syobocal::DB::TitleLookup.get(param)
      puts result.code
      puts result.message
      pp result
    #  @test01 = result[0][:tid];
      animeTitleList = Array.new;
      
      result.each do |r_title|
        animeTitle = AnimeTitle.new;
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
              staffName = array[2]
              logger.debug(" staffRoll:" + staffRollName + " staffName:" + staffName)
             
              # スタッフ名登録 
              animeStaff = AnimeStaff.new
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
        animeTitleList.push(animeTitle)
      end
      @animeTItleList = animeTitleList
    end

  module CommentType
    LINK = 1,
    STAFF = 2,
    CAST = 3,
    OPENING = 4,
    ENDING = 5
  end

  private
    def setComment
    end
end

