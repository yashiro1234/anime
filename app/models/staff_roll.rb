class StaffRoll < ActiveRecord::Base

  def saveStaffRoll(staffName)
    result = StaffRoll.where(name: staffName)
    logger.debug(result)
    if result.empty? then
      saveStaff = StaffRoll.new
      saveStaff.name = staffName
      saveStaff.save
      r = StaffRoll.where(name: staffName)
      return r.pluck(:id)[0]
    else
      return result.pluck(:id)[0]
    end
  end
end
