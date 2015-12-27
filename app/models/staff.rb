class Staff < ActiveRecord::Base
  has_many :staff_relates
  has_many :titles, through: :staff_relates
  has_many :staff_rolls, through: :staff_relates

  public
  def saveStaff(staffName)
    resultStaff = Staff.where(name: staffName)
    logger.debug(resultStaff)
    if resultStaff.empty? then
      saveStaff = Staff.new
      saveStaff.name = staffName
      saveStaff.save
      logger.info "スタッフを追加しました[staffName=#{staffName}]"
      r = Staff.where(name: staffName)
      return r.pluck(:id)[0]
    else
      return resultStaff.pluck(:id)[0]
    end
  end
end
