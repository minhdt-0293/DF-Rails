class Api::Admin::BaseAdminController < ApplicationController
  def dashboard
    render json: management_info
  end

  private
  def management_info
    user_count = User.count
    category_count = Category.count
    order_count = Order.count
    product_count = Product.count

    {
      user_count: user_count,
      category_count: category_count,
      order_count: order_count,
      product_count: product_count,
    }
  end
end
