class AddBoookingStatustoBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :rent_status, :string, default: 'pending'
  end
end
