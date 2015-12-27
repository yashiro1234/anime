class Channel < ActiveRecord::Base
  belongs_to :channel_group
  has_many :programs
end
