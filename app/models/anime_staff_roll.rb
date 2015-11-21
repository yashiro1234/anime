class AnimeStaffRoll < ActiveRecord::Base

  def saveStaffRoll(staffName)
    result = AnimeStaffRoll.where(name: staffName)
    logger.debug(result)
    if result.empty? then
      saveStaff = AnimeStaffRoll.new
      saveStaff.name = staffName
      saveStaff.save
      r = AnimeStaffRoll.where(name: staffName)
      return r.pluck(:id)[0]
    else
      return result.pluck(:id)[0]
    end
  end
end
