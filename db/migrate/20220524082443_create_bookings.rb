class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :furniture_id
      t.integer :start_date
      t.integer :end_date
      t.integer :total_price

      t.timestamps
    end
  end
end
