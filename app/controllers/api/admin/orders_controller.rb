class Api::Admin::OrdersController < ApplicationController
  skip_before_action :authenticate_user

  def index
    orders = Order.all.page(params[:page])
    total_pages = orders.total_pages
    message = "Success"
    render json: {status: :ok, message: message, orders: orders, total_pages: total_pages}
  end

  def show
    order = Order.find_by(id: params[:id])
    order_details = Order.get_order_details(order.id)
    user = User.get_info_user order.user_id
    message = "Success"
    render json: {status: :ok, message: message, order: order, order_details: order_details, user: user}
  end

  def update
    order = Order.find params[:id]

    order.update order_params
    render json: {status: :ok, order: order}
  end

  private

  def order_params
    params.require(:order).permit Order::ORDER_ATTRIBUTES
  end
end
