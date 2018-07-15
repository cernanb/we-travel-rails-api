require 'rails_helper'

RSpec.describe Api::V1::WeworksController, type: :controller do

  let!(:wework1) { create(:wework) }
  let!(:wework2) { create(:wework, name: "Aventine", city: "La Jolla") }

  context 'actions' do
    describe 'GET index' do
      it 'returns all of the weworks' do
        get :index
        expect(assigns[:weworks]).to include(wework1, wework2)
      end
    end
    
    describe 'GET show' do
      it 'returns a single wework based on id' do
        get :show, params: {id: wework1.id}
        expect(assigns[:wework]).to eq(wework1)
      end
    end
  end
end
