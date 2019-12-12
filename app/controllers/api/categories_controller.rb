class Api::CategoriesController < ApplicationController
  skip_before_action :authenticate_user

  def index
    drink_categories = Category.by_product_type(Product.product_types[:drink]).uniq
    food_categories = Category.by_product_type(Product.product_types[:food]).uniq
    drink_products = Product.by_category(drink_categories.first.id)
    food_products = Product.by_category(food_categories.first.id)

    drink_products = drink_products.map {|product| product.product_info(request.base_url)}
    food_products = food_products.map {|product| product.product_info(request.base_url)}
    render json: {
      drink_categories: drink_categories,
      food_categories: food_categories,
      drink_products: drink_products,
      food_products: food_products,
      status: :ok}
  end
end
