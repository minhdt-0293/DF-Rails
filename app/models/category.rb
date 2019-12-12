class Category < ApplicationRecord
  has_many :products
  mount_uploader :image, ImageUploader

  scope :by_product_type, -> (type){ joins(:products).where({products: {product_type: type}}) }
end
