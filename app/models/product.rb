class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings
  has_many :order_details

  scope :get_all_products, -> do
    joins(:category).select("products.*, categories.name as category_name")
  end
end
