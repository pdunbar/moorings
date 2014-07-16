class ChangeLatlongToFloat < ActiveRecord::Migration
  def change
    change_column :moorings, :latitude, :float
    change_column :moorings, :longitude, :float
  end
end
