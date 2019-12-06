class Api::ProductsController < ApplicationController
  def index
    products = Product.get_all_products.page(params[:page])
    total_pages = products.total_pages
    render json: {status: :ok, products: products, total_pages: total_pages}
  end
end
