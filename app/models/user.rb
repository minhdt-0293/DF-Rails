class User < ApplicationRecord
  has_many :orders

  has_secure_password

  scope :get_info_user, ->(id){where(id: id).select(:id, :username, :email, :address, :phone, :image, :role).first}
end
