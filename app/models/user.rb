class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :address_city, :address_state, :address_street, :address_country, presence: true

  
end
