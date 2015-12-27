class StaffRelate < ActiveRecord::Base
  belongs_to :title
  belongs_to :staff
  belongs_to :staff_roll
end
