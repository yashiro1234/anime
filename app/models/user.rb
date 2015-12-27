class User < ActiveRecord::Base
  belongs_to :channel_group
  has_many :channels, through: :channel_group
  has_many :programs, through: :channels

  scope :with_ch_name, -> {joins(:channels)}
  def self.login_user
    # テスト
    User.find(1)
  end
end
