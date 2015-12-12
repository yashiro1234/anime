class AnimeSubTitle < ActiveRecord::Base
  belongs_to :anime_title,
             foreign_key: "tld"
end
