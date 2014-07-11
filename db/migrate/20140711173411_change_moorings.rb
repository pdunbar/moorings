class ChangeMoorings < ActiveRecord::Migration
  def change
    add_column :moorings, :latitude, :decimal, null: false
    add_column :moorings, :longitude, :decimal, null: false
  end
end
