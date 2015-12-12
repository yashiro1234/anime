class AnimeStaff < ActiveRecord::Base

  public
  def saveStaff(staffName)
    resultStaff = AnimeStaff.where(name: staffName)
    logger.debug(resultStaff)
    if resultStaff.empty? then
      saveStaff = AnimeStaff.new
      saveStaff.name = staffName
      saveStaff.save
      logger.info "スタッフを追加しました[staffName=#{staffName}"
      r = AnimeStaff.where(name: staffName)
      return r.pluck(:id)[0]
    else
      return resultStaff.pluck(:id)[0]
    end
  end
end
