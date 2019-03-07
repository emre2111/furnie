class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @booking = Booking.find(params[:booking_id])
    @products = Product.all

    @products = @products.joins(rooms: :product_rooms).distinct.where(rooms: { name: params[:product_room] }) if params[:product_room].present? unless params[:product_room] == "all"
    @products = @products.where(category: params[:category]) if params[:category].present? unless params[:category] == "all"
    @products = @products.where(style: params[:style]) if params[:style].present? unless params[:style] == "all"
    @products = @products.where(material: params[:material]) if params[:material].present? unless params[:material] == "all"

    #pagination
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.find(params[:booking_id])
  end
end
