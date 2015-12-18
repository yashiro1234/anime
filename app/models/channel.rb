class Channel < ActiveRecord::Base
  belongs_to :user,
             foreign_key: "ch_gid"
  belongs_to :channel_group,
             foreign_key: "ch_gid"
  has_many :programs,
           foreign_key: "ch_id"
end
