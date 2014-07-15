class ChangeNameOfTypeColumnBoats < ActiveRecord::Migration
  def change
    rename_column :boats, :type, :type_of
  end
end
