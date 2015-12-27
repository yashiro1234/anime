class CreateChannelGroups < ActiveRecord::Migration
  def change
    create_table :channel_groups do |t|
      t.string :ch_group_name
      t.text :ch_group_comment
      t.integer :ch_group_order

      t.timestamps null: false
    end
  end
end
