class Product < ApplicationRecord
  has_one :category
  has_many :ratings
  has_many :order_details

  scope :get_by_category_id, ->(id){where(category_id: id)}

  PRODUCT_ATTRIBUTES = %i(name price quantity image type description)

  def set_api_url base_url
    {
      id: self.id,
      name: self.name,
      price: self.price,
      quantity: self.quantity,
      type: self.type,
      avg_rating: self.avg_rating,
      description: self.description,
      image: "#{base_url}#{self.image}"
    }
  end
end
