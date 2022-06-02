class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @cat = Cat.find(params[:cat_id])
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.cat_id = @cat.id
    @booking.user_id = @user.id
    if @booking.save!
      redirect_to renter_bookings_path(@cat)
    else
      render :new
    end
  end

  def renter_bookings
    @bookings = Booking.all
  end


  def booking_params
    params.require(:booking).permit(:date_to, :date_from, :cat_id, :status)
  end

  def approve_rent
    @booking = Booking.find(params[:format])
    # @cat = Cat.find(params[:format])
    @booking.rent_status = 'accepted'
    @booking.save
    redirect_to renter_bookings_path, notice: "Rent status change to Approved"
  end

  # def reject_rent
  #   @cat = Cat.find[params[:id]]
  #   @cat.rent_status = 'rejected'
  #   redirect_to renter_bookings_path(@cat), notice: "Rent status change to Rejected"
  # end

end
