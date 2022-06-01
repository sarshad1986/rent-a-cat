class RemoveBookingFromCats < ActiveRecord::Migration[7.0]
  def change
    remove_column :cats, :rent_status, :string
  end
end
