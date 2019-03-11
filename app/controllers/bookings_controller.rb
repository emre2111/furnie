  class BookingsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show, :create]

  def show
    @booking = Booking.find(params[:id])
    @items = @booking.items
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    # @booking.starts_at = Date.today
    if @booking.save
      redirect_to booking_products_path(@booking)
    else
      flash[:alert] = "Please try again"
      redirect_to root_path
    end
  end

  def total_price
    duration = ends_at - starts_at + 1
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

  def confirmation
    @booking = current_user.bookings.where(state: 'paid').find(params[:id])
    @items = @booking.items
  end

  def booking_duration
    (@booking.ends_at - @booking.starts_at + 1).to_i
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
