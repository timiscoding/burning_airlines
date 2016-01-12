class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.text :origin
      t.text :destination
      t.text :date
      t.integer :plane_id

      t.timestamps null: false
    end
  end
end
