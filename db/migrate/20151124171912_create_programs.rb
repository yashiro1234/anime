class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :title_id
      t.integer :channel_id
      t.datetime :st_time
      t.integer :st_offset
      t.datetime :ed_time
      t.integer :story
      t.string :sub_title
      t.text :prog_comment
      t.integer :flag
      t.integer :deleted
      t.integer :warn
      t.integer :revision

      t.timestamps null: false
    end
  end
end
