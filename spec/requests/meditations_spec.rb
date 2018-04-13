require 'rails_helper'

RSpec.describe 'Meditations API', type: :request do
  let(:user) { create :user }
  let!(:meditations) { create_list :meditation , 2 }
  let(:headers) { valid_headers }

  describe 'GET /meditations' do
    before { get '/meditations', params: {}, headers: headers }

    it 'returns an ok status' do
      expect(response).to have_http_status(200)
    end

    it 'returns an correct total' do
      expect(json['meta']['total']).to eq(2)
    end
  end
end
