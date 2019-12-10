class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_one :category
  has_many :ratings
  has_many :order_details

  scope :get_by_category_id, ->(id){where(category_id: id)}

  PRODUCT_ATTRIBUTES = %i(name price quantity image product_type description)

  def set_api_url base_url
    {
      id: self.id,
      name: self.name,
      category_id: self.category_id,
      price: self.price,
      quantity: self.quantity,
      product_type: self.product_type,
      avg_rating: self.avg_rating,
      description: self.description,
      image: "#{base_url}#{self.image}"
    }
  end
end
