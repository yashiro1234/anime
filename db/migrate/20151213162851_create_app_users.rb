class CreateAppUsers < ActiveRecord::Migration
  def change
    create_table :app_users do |t|
      t.string :name
      t.integer :channel_group_id

      t.timestamps null: false
    end
  end
end
