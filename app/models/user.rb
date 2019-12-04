class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :orders

  has_secure_password

  scope :get_info_user, ->(id){where(id: id).select(:id, :username, :email, :address, :phone, :image, :role).first}

  USER_ATTRIBUTES = %i(address phone role image)

  def user_info base_url
    {
      id: self.id,
      email: self.email,
      username: self.username,
      address: self.address,
      phone: self.phone,
      image: {url: "#{base_url}#{self.image.url}"},
      role: self.role
    }
  end
end
