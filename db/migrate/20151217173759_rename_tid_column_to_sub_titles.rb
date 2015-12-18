class RenameTidColumnToSubTitles < ActiveRecord::Migration
  def change
    rename_column :sub_titles, :tid, :title_id
  end
end
