class Title < ActiveRecord::Base
  # 主キーを変更
  #self.primary_key = :id
  has_many :staff_relates
  has_many :staffs, through: :staff_relates
  has_many :staff_rolls, through: :staff_relates
  has_many :sub_titles
end