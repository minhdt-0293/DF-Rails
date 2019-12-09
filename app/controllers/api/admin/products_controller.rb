class Api::Admin::ProductsController < ApplicationController
  skip_before_action :authenticate_user

  def index
    products = Product.all.page(params[:page])
    total_pages = products.total_pages
    products = products.map{|product| product.by_category(request.base_url)}
    message = "Success"
    render json: {status: :ok, message: message, products: products, total_pages: total_pages}
  end

  def destroy
    product = Product.find_by id: params[:id]
    product.destroy unless product.nil?
    products = Product.all.page(params[:page])
    total_pages = products.total_pages
    products = products.map{|product| product.by_category(request.base_url)}
    if total_pages < params[:page].to_i
      products = Product.all.page(total_pages)
    end
    message = "Success"
    render json: {status: :ok, message: message, products: products, total_pages: total_pages}
  end

  private

  def products_params
    params.require(:product).permit Product::PRODUCT_ATTRIBUTES
  end
end
