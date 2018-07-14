require 'rails_helper'

RSpec.describe User, type: :model do
  context "Associations" do
    it { should have_many(:visits) }
    it { should have_many(:weworks) }
  end

  context "Validations" do 
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:address_street) }
    it { should validate_presence_of(:address_city) }
    it { should validate_presence_of(:address_state) }
    it { should validate_presence_of(:address_country) }
  end
end
