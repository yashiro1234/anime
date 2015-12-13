class CreateSubTitles < ActiveRecord::Migration
  def change
    create_table :sub_titles do |t|
      t.integer :tid
      t.integer :story
      t.string :sub_title

      t.timestamps null: false
    end
  end
end
