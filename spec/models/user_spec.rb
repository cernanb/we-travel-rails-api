require 'rails_helper'

RSpec.describe User, type: :model do
  context "Associations" do
    it { should have_many(:visits) }
    it { should have_many(:weworks) }
  end

  context "Validations" do 
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address_street) }
    it { should validate_presence_of(:address_city) }
    it { should validate_presence_of(:address_state) }
    it { should validate_presence_of(:address_country) }
    it { should validate_uniqueness_of(:email) }
    it 'requires a valid email' do
      user1 = build(:user, email: 'cernan.com')
      user2 = build(:user, email: 'cernan@something')
      user3 = build(:user, email: 'cernan')

      expect(user1.valid?).to eq(false)
      expect(user1.errors.full_messages).to eq([
        "Email is invalid"
      ])
      expect(user2.valid?).to eq(false)
      expect(user3.valid?).to eq(false)
    end
  end

  describe 'on save' do
    it 'hashes a password' do
      user = create(:user)

      expect(user.password_digest).to_not eq(user.password)
    end
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
