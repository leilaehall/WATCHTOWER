class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.string :delivery_address
      t.references :watch
      t.references :user

      t.timestamps
    end
  end
end
