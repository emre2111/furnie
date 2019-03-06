class BookingItemsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking])
    @product = Product.find(params[:product])
    @booking_item = BookingItem.new(booking_item_params)
    # @item = Item.find(params[:product_id])
    @booking_item.item = @item
    if @booking_item.save
      redirect_to booking_products_path(@booking)
    else
      flash[:alert] = "please try again"
      render
    end
  end

  private

  def booking_item_params
    params.require(:booking_item).permit(:booking_id, :item_id)
  end
end
