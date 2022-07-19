class PaymentsController < ApplicationController
  def new
    @payment = current_user.bookings.last
    authorize @payment
    # @booking = current_user.bookings.where(status: 'pending').find(params[:booking_id])
  end
end
