class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.integer :user, null: false
      t.string :type, null: false
      t.integer :length, null: false
      t.timestamps
    end
  end
end
