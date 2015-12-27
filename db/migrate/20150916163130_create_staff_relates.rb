class CreateStaffRelates < ActiveRecord::Migration
  def change
    create_table :staff_relates do |t|
      t.integer :title_id
      t.integer :staff_id
      t.integer :staff_roll_id

      t.timestamps null: false
    end
  end
end
