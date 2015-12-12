class AnimeTitle < ActiveRecord::Base
  has_many :anime_staffs,
           foreign_key: "tld"
  has_many :anime_sub_titles,
           foreign_key: "tld"
end
