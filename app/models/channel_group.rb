class ChannelGroup < ActiveRecord::Base
  has_many :channels,
           foreign_key: "ch_gid"
end
