class CreateStaffRolls < ActiveRecord::Migration
  def change
    create_table :staff_rolls do |t|
      t.string :name
      t.string :name_yomi

      t.timestamps null: false
    end
  end
end
