class UpdateReservationsTable < ActiveRecord::Migration
  def change
    rename_column :reservations, :boat, :boat_id
    rename_column :reservations, :mooring, :mooring_id
  end
end
