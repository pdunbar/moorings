class CreateHarbors < ActiveRecord::Migration
  def change
    create_table :harbors do |t|
      t.string :name, null: false
      t.string :state, null: false
      t.text :description
    end
  end
end
