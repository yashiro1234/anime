class SubTitle < ActiveRecord::Base
  belongs_to :title,
             foreign_key: "tld"
end
