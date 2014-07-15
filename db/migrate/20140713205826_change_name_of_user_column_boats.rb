class ChangeNameOfUserColumnBoats < ActiveRecord::Migration
  def change
    rename_column :boats, :user, :user_id
  end
end
