class OrderDetail < ApplicationRecord
  has_one :product
  has_one :order
end
