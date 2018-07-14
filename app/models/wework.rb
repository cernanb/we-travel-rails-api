class Wework < ApplicationRecord
  validates :name, :city, :country, presence: true

  has_many :visits
  has_many :users, through: :visits
end
