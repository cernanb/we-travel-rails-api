class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :address_city, :address_state, :address_street, :address_country, :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


  has_many :visits
  has_many :weworks, through: :visits

  def check_in_to_wework(wework)
    self.visits.create(wework: wework)
  end
end
