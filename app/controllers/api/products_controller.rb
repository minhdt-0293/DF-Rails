class Api::ProductsController < ApplicationController
  skip_before_action :authenticate_user

  def index
    products = Product.by_category(params[:category_id]) if params[:category_id].present?
    products = products.map {|product| product.product_info(request.base_url)}
    if params[:product_type] == "drink"
      render json: {drink_products: products, status: :ok}
    elsif params[:product_type] == "food"
      render json: {food_products: products, status: :ok}
    end
  end
end
