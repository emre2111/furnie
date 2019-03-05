class ProductsController < ApplicationController
  def index
    @products = Product.all
    #For Filter Sidebar
    @products = @products.where(product_category: params[:product_category]) if params[:product_category].present?
    @products = @products.where(style: params[:style]) if params[:style].present?
    @products = @products.where(material: params[:material]) if params[:material].present?
  end

  # def show
  #   @product = Product.find(params[:id])
  # end
end