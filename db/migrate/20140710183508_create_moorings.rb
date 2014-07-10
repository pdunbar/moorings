class CreateMoorings < ActiveRecord::Migration
  def change
    create_table :moorings do |t|
      t.integer :harbor, null: false
      t.integer :user, null: false
      t.string :state, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
