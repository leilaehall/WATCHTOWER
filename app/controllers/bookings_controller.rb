class BookingsController < ApplicationController
  def new
    @watch = Watch.find(params[:watch_id])
    @booking = Booking.new
  end

  def create
    @watch = Watch.find(params[:watch_id])
    @booking = Booking.new(booking_params)
    @booking.watch = @watch
    @booking.status = 'pending'
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :delivery_adress)
  end
end
