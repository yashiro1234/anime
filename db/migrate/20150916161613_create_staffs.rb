class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :name_yomi
      t.string :option
      t.timestamps null: false
    end
  end
end
