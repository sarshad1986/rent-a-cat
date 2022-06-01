class AddRentStatusToCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :rent_status, :string, default: 'pending'
  end
end
