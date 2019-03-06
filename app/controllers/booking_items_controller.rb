class BookingItemsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @product = Product.find(params[:product_id])
    @booking_item = BookingItem.new(booking_item_params)
    # ToDo - find only available item
    @item = Item.where(product_id: params[:product_id]).first
    @booking_item.item = @item
    if @booking_item.save
      redirect_to booking_product_path(@booking, @product)
      flash[:notice] = "Item added to your cart"
    else
      flash[:alert] = "please try again"
      render :create
    end
  end

  private

  def booking_item_params
    params.permit(:booking_id)
  end
end
