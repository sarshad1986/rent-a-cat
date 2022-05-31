class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @cat = Cat.find(params[:cat_id])
  end

def create
  @booking = Booking.new(booking_params)
  @booking.save
end


def booking_params
  params.require(:booking).permit(:date_to, :date_from, :cat_id)
end

end
