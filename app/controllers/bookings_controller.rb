class BookingsController < ApplicationController
  before_action :set_booking, only: :show
  before_action :set_furniture, only: :create

  def show
    authorize @booking
    @furniture = @booking.furniture
    @session = Stripe::Checkout::Session.retrieve(@booking.checkout_session_id)
    @booking.update(status: "paid") if @session.payment_status == "paid"
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.furniture_id = @furniture.id
    @booking.user_id = current_user.id
    @booking.total_price = (@furniture.price_per_day * ((Time.parse(@booking.end_date.to_s).to_i - Time.parse(@booking.start_date.to_s).to_i) / (60 * 60 * 24))) + 9
    authorize @booking

    if @booking.save!
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @furniture.id,
          amount: @booking.total_price * 100,
          currency: 'eur',
          quantity: 1
        }],
        success_url: booking_url(@booking),
        cancel_url: booking_url(@booking)
      )
      @booking.update(checkout_session_id: session.id)
      @booking.update(status: "pending")
      redirect_to new_furniture_booking_payment_path(@furniture.id, @booking.id)
    else
      flash[:alert] = "Erreur, vérifiez les informations"
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
