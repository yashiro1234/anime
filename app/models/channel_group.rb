class ChannelGroup < ActiveRecord::Base
  has_one :user
  has_many :channels
end
