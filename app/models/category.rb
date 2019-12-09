class Category < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :products

  scope :by_product_type, -> (type){ joins(:products).where({products: {product_type: type}}) }

  CATEGORY_ATTRIBUTES = %i(name image description)

  def set_api_url base_url
    {
      id: self.id,
      name: self.name,
      description: self.description,
      image: "#{base_url}#{self.image.url}",
    }
  end
end
