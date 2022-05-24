class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :set_furniture, only: [:create, :new]

  def index
    @bookings = Booking.all
  end

  def show() end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.furniture_id = @furniture.id
    @booking.user_id = current_user.id
    @booking.total_price = @furniture.price_per_day * (@booking.end_date - @booking.start_date).to_i
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    
  end


  private

  def booking_params
    params.require(:booking).permit(:total_price, :start_date, :end_date)
  end

  def set_furniture
    @furniture = Furniture.find(params[:furniture_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
