class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.starts_at = Date.today + 1
    if @booking.save
      redirect_to products_path
    else
      flash[:alert] = "please try again"
      redirect_to root_path
    end
  end

  def total_price
    duration = ends_at - starts_at
    duration.to_i * @product.price_in_cents
  end

  private

  def booking_params
    params.require(:booking).permit(:ends_at)
  end
end
