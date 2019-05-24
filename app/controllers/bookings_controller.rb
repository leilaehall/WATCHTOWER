class BookingsController < ApplicationController
  before_action :set_watch, only: [:new, :create]
  def index
    @pending_bookings = current_user.bookings.where(status: 'pending')
    @accepted_bookings = current_user.bookings.where(status: 'accepted')
    # outgoing bookings goes through watches

    @incoming_bookings = current_user.incoming_bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    start_date = Date.strptime(params[:booking][:start_date].split(" ")[0], '%m/%d/%Y')
    end_date = Date.strptime(params[:booking][:start_date].split(" ")[2], '%m/%d/%Y')
    @booking.start_date = start_date
    @booking.end_date = end_date

    @booking.watch = @watch
    @booking.status = 'pending'
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    if @booking.status == 'pending'
      @booking.status = 'accepted'
      @booking.save
    end
    redirect_to bookings_path
  end

  def decline
    @booking = Booking.find(params[:id])
    if @booking.status == 'pending'
      @booking.status = 'declined'
      @booking.save
    end
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:delivery_address)
  end

  def set_watch
    @watch = Watch.find(params[:watch_id])
  end
end
