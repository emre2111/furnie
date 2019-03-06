class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.starts_at = Date.today
    if @booking.save
      redirect_to booking_products_path(@booking)
    else
      flash[:alert] = "please try again"
      redirect_to root_path
    end
  end

  def total_price
    duration = ends_at - starts_at
    duration.to_i * @product.price_in_cents
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    flash[:notice] = 'The date has been changed.'
    redirect_to booking_products_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:ends_at)
  end
end
