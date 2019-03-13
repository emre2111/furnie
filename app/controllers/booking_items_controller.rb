class BookingItemsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @product = Product.find(params[:product_id])
    @booking_item = BookingItem.new(booking_item_params)
    # ToDo - find only available item
    @item = @product.items.first
    # @item = Item.where(product_id: params[:product_id]).first
    @booking_item.item = @item
    if @booking_item.save
      redirect_to booking_product_path(@booking, @product)
      flash[:notice] = "Item added to your cart"
    else
      flash[:alert] = "please try again"
      redirect_to booking_product_path(@booking, @product)
    end
  end

   def destroy
    @booking = Booking.find(params[:booking_id])
    @product = Product.find(params[:product_id])

    # @item = @product.items
    @item = Item.find(params[:id])
    @item.destroy
    # redirect_to booking_product_booking_item_path(@booking, @product, @item)
    redirect_to booking_path(@booking)
    # /bookings/:booking_id/products/:product_id/booking_items/:id(.:format)
  end

  private

  def booking_item_params
    # params.require(:booking_item).permit(:booking_id, :product_id)
    params.permit(:booking_id)
  end
end
