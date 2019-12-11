class OrderDetail < ApplicationRecord
  has_one :product
  belongs_to :order
  delegate :name, to: :product, allow_nil: true
end
