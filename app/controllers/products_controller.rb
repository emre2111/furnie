class ProductsController < ApplicationController
  def index
    @booking = Booking.find(params[:booking_id])
    @products = Product.all
    #For Filter Sidebar
    @products = @products.where(product_category: params[:product_category]) if params[:product_category].present?
    @products = @products.where(style: params[:style]) if params[:style].present?
    @products = @products.where(material: params[:material]) if params[:material].present?
  end

  private

  # def booking_params
  #   params.require(:booking).permit(:booking_id)
  # end
end
