class Title < ActiveRecord::Base
  has_many :staffs, foreign_key: "tld"
  has_many :sub_titles, :class_name => "SubTitle", foreign_key: "title_id"
end