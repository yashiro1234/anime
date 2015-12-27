class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :channel_group_id
      t.string :ch_name
      t.string :ch_epgname
      t.string :ch_url
      t.string :ch_epgurl
      t.text :ch_comment
      t.integer :ch_number

      t.timestamps null: false
    end
  end
end
