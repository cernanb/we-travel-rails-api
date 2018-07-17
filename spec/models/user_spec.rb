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

  describe "instance methods" do
    context "check_in_to_wework" do
      it "creates a visit for the user" do
        user = create(:user)
        wework = create(:wework)

        user.check_in_to_wework(wework)

        expect(user.visits.last.wework_id).to eq(wework.id) 
      end
    end
  end
end
