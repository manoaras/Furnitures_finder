class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :show]
  before_action :set_furniture, only: [:create]

  # Plus besoin parce que Booking.new géré depuis Furnitures#Show
  # def show() end

  # def new
  #   @booking = Booking.new
  #   authorize @booking
  # end

  def show
    authorize @booking
    @furniture = @booking.furniture
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.furniture_id = @furniture.id
    @booking.user_id = current_user.id
    @booking.total_price = @furniture.price_per_day * ((Time.parse(@booking.end_date.to_s).to_i - Time.parse(@booking.start_date.to_s).to_i) / (60*60*24))
    authorize @booking
    if @booking.save!
      flash[:alert] = "Booking confirmed"
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "Error, please verify information"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
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
