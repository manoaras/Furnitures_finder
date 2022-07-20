class PaymentsController < ApplicationController
  def new
    @payment = current_user.bookings.find(params[:booking_id])
    authorize @payment
  end
end
