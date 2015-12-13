class Title < ActiveRecord::Base
  has_many :staffs,
           foreign_key: "tld"
  has_many :sub_titles,
           foreign_key: "tld"
end
