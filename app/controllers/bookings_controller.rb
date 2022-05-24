class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.all
  end

  def show() end

    def method_name
      
    end






  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
