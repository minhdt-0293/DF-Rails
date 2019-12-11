class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details
  has_many :products, through: :order_details

  scope :get_order_details, ->(order_id){
    where("orders.id = ?", order_id).joins(:order_details)
    .where("orders.id = order_details.order_id").joins("LEFT JOIN products ON order_details.product_id = products.id")
    .select("order_details.*, products.name as product_name")}

  ORDER_ATTRIBUTES = %i(status)
end
