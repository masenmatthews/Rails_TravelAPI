require 'rails_helper'

describe 'get all destinations route', :type => :request do
  let!(:destinations) { FactoryBot.create_list(:destination, 20) }

  before { get '/destinations'}

  # old test below changed how api works not valid now
  # it 'returns all destinations' do
  #   expect(JSON.parse(response.body).size).to eq(20)
  # end

  it 'returns status do 200' do
    expect(response).to have_http_status(:success)
  end

end
