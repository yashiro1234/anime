class StaffRoll < ActiveRecord::Base
  has_many :staff_relates
  has_many :titles, through: :staff_relates
  has_many :staffs, through: :staff_relates

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
