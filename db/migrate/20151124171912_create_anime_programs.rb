class CreateAnimePrograms < ActiveRecord::Migration
  def change
    create_table :anime_programs do |t|
      t.integer :pid
      t.integer :tid
      t.datetime :st_time
      t.integer :st_offset
      t.datetime :ed_time
      t.integer :story
      t.string :sub_title
      t.text :prog_comment
      t.integer :flag
      t.integer :deleted
      t.integer :warn
      t.integer :ch_id
      t.integer :revision

      t.timestamps null: false
    end
  end
end
