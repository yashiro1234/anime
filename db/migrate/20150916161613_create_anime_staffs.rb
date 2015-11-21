class CreateAnimeStaffs < ActiveRecord::Migration
  def change
    create_table :anime_staffs do |t|
      t.string :name
      t.string :name_yomi

      t.timestamps null: false
    end
  end
end
