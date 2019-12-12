class Product < ApplicationRecord
  has_one :category
  has_many :ratings
  has_many :order_details
  mount_uploader :image, ImageUploader

  enum product_type: { drink: 1, food: 2 }

  scope :by_category, -> (category_id){ where(category_id: category_id)}

  def product_info base_url
    {
      id: self.id,
      category_id: self.category_id,
      price: self.price,
      quantity: self.quantity,
      product_type: self.product_type,
      image: {url: "#{base_url}#{self.image.url}"},
      avg_rating: self.avg_rating,
      description: self.description,
      name: self.name
    }
  end
end
