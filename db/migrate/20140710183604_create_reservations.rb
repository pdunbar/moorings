class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :boat, null: false
      t.integer :mooring, null: false
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.timestamps
    end
  end
end
