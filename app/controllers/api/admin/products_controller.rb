class Api::Admin::ProductsController < ApplicationController
  skip_before_action :authenticate_user

  def index
    products = Product.all.page(params[:page])
    total_pages = products.total_pages
    products = products.map{|product| product.product_info(request.base_url)}
    message = "Success"
    render json: {status: :ok, message: message, products: products, total_pages: total_pages}
  end

  def create
    product = Product.new product_params

    if product.save
      product = product.product_info request.base_url
      render json: {status: :ok, product: product}
    else
      render json: {status: :bad_request, errors: product.errors}
    end
  end

  def show
    product = Product.find_by(id: params[:id]).product_info(request.base_url)
    message = "Success"
    render json: {status: :ok, message: message, product: product}
  end

  def update
    product = Product.find params[:id]

    product.update product_params
    render json: {status: :ok, product: product.product_info(request.base_url)}
  end

  def destroy
    product = Product.find_by id: params[:id]
    product.destroy unless product.nil?
    products = Product.all.page(params[:page])
    total_pages = products.total_pages
    products = products.map{|product| product.product_info(request.base_url)}
    if total_pages < params[:page].to_i
      products = Product.all.page(total_pages)
    end
    message = "Success"
    render json: {status: :ok, message: message, products: products, total_pages: total_pages}
  end

  private

  def product_params
    params.require(:product).permit Product::PRODUCT_ATTRIBUTES
  end
end
