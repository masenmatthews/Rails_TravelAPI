require 'rails_helper'

describe 'post a destination route', :type => :request do

    before do
      post '/destinations', params: { :country => "USA", :city => "Houston", region: 'Texas'}
    end

    it 'returns the country name' do
      expect(JSON.parse(response.body)['country']).to eq('USA')
    end

    it 'returns the city' do
      expect(JSON.parse(response.body)['city']).to eq('Houston')
    end

    it 'returns the city' do
      expect(JSON.parse(response.body)['region']).to eq('Texas')
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end

end
