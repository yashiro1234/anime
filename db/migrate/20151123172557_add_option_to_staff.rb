class AddOptionToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :option, :string
  end
end
