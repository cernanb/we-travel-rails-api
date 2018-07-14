class Wework < ApplicationRecord
  validates :name, :city, :country, presence: true
end
