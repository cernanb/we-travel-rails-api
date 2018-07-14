class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :wework

  validates :visited, presence: true
end
