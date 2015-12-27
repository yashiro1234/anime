class RenameChGidToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :ch_gid, :channel_group_id
  end
end
