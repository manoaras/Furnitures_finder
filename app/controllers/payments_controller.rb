class PaymentsController < ApplicationController
  def new
    @payment = current_user.bookings.where(status: 'pending').find(params[:booking_id])
    authorize @payment
  end
end
