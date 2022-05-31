class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date_from
      t.date :date_to
      t.references :users, null: false, foreign_key: true
      t.references :cats, null: false, foreign_key: true

      t.timestamps
    end
  end
end
