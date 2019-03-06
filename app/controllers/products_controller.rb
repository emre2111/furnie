class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @booking = Booking.find(params[:booking_id])
    @products = Product.all
    #For Filter Sidebar
    @products = @products.joins(rooms: :product_rooms).where(rooms: { name: params[:name] }) if params[:name].present?
    @products = @products.where(product_category: params[:product_category]) if params[:product_category].present?
    @products = @products.where(style: params[:style]) if params[:style].present?
    @products = @products.where(material: params[:material]) if params[:material].present?
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.find(params[:booking_id])
  end

end
