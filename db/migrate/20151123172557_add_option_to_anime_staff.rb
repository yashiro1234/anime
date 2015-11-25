class AddOptionToAnimeStaff < ActiveRecord::Migration
  def change
    add_column :anime_staffs, :option, :string
  end
end
