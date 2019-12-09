class Category < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :products

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
