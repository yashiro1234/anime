class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :ch_gid

      t.timestamps null: false
    end
  end
end
