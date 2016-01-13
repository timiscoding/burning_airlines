class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :flight_id
      t.integer :user_id
      t.boolean :status, :default => false

      t.timestamps null: false
    end
  end
end
