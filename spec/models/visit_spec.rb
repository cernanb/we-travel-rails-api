require 'rails_helper'

RSpec.describe Visit, type: :model do
  context "Validations" do
    it { should validate_presence_of (:visited) }
  end

  context 'Associations' do 
    it { should belong_to (:user) }
    it { should belong_to (:wework) }
  end
end
