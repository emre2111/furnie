class RandomBookingItemsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @product = Product.find(params[:product_id])
    @booking_item = BookingItem.new(booking_item_params)
    # ToDo - find only available item
    @item = @product.items.first
    # @item = Item.where(product_id: params[:product_id]).first
    @booking_item.item = @item
    @booking_item.save
    end

  private

  def booking_item_params
    # params.require(:booking_item).permit(:booking_id, :product_id)
    params.permit(:booking_id)
  end
end
