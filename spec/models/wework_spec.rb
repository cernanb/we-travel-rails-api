require 'rails_helper'

RSpec.describe Wework do
  context "Validations" do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:country) }
  end
end
