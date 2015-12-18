class User < ActiveRecord::Base
  has_many :channels,
           foreign_key: "ch_gid"
  def self.login_user
    # テスト
    User.find(1)
  end
end
