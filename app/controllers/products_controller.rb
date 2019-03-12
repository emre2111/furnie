class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @booking = Booking.find(params[:booking_id])
    @products = Product.order(:name).page(params[:page]) #for gem kaminari
    @products = @products.joins(rooms: :product_rooms).distinct.where(rooms: { name: params[:product_room] }) if params[:product_room].present? unless params[:product_room] == "all"
    @products = @products.where(category: params[:category]) if params[:category].present? unless params[:category] == "all"
    @products = @products.where(style: params[:style]) if params[:style].present? unless params[:style] == "all"
    @products = @products.where(material: params[:material]) if params[:material].present? unless params[:material] == "all"

    # #pagination
    # order_by_price(params[:order_by_price])
    # order_by_name(params[:order_by_name])
    # order_by_category(params[:order_by_category])
    respond_to do |format|
      format.html { render 'products/index' }
      format.js  # <-- will render `app/views/products/index.js.erb`
    end
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.find(params[:booking_id])
  end

  private

  def order_by_price(order)
    if order == "lowest to highest"
      @products = @products.sort_by { |p| p.price_cents }
    elsif order == "highest to lowest"
      @products = @products.sort_by { |p| p.price_cents }.reverse
    else
      @products
    end
  end

  def order_by_name(order)
    if order == "A..Z"
      @products = @products.sort_by { |p| p.name }
    elsif order == "Z..A"
      @products = @products.sort_by { |p| p.name }.reverse
    else
      @products
    end
  end

  def order_by_category(order)
    if order == "A..Z"
      @products = @products.sort_by { |p| p.category }
    elsif order == "Z..A"
      @products = @products.sort_by { |p| p.category }.reverse
    else
      @products
    end
  end
end
