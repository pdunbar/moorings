class AddIdsToMoorings < ActiveRecord::Migration
  def change
    rename_column :moorings, :harbor, :harbor_id
    rename_column :moorings, :user, :user_id
  end
end
