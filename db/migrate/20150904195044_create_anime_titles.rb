class CreateAnimeTitles < ActiveRecord::Migration
  def change
    create_table :anime_titles do |t|
      t.integer :tid
      t.string :title
      t.string :short_title
      t.string :title_yomi
      t.string :title_en
      t.text :comment
      t.integer :cat
      t.integer :title_flag
      t.integer :first_year
      t.integer :first_month
      t.integer :first_end_year
      t.integer :first_end_month
      t.integer :first_chid
      t.string :keywords
      t.integer :user_point
      t.integer :user_point_rank
      t.datetime :last_update

      t.timestamps null: false
    end
  end
end
