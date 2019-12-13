class Category < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :products
  validates :name, presence: true, uniqueness: true
  validates :image, presence: true
end
