class CreateAnimeStaffRelates < ActiveRecord::Migration
  def change
    create_table :anime_staff_relates do |t|
      t.integer :tid
      t.integer :staff_id
      t.integer :staff_roll_id

      t.timestamps null: false
    end
  end
end
