require 'rails_helper'

RSpec.describe 'Meditations API', type: :request do
  let(:user) { create :user }
  let!(:meditations) { create_list :meditation , 2, user: user }
  let(:headers) { valid_headers }

  let!(:notification_one) {
    create :notification, user: user, meditation: meditations.first
  }

  let!(:notification_two) {
    create :notification, user: user, meditation: meditations.second
  }

  describe 'GET /meditations' do
    before { get '/meditations', params: {}, headers: headers }

    it 'returns an ok status' do
      expect(response).to have_http_status(200)
    end

    it 'returns an correct total' do
      expect(json['meta']['total']).to eq(2)
    end
  end

  describe 'GET /meditations/:id' do
    before {
      get "/meditations/#{meditations[0].id}",
      params: {},
      headers: headers
    }

    it 'returns an ok status' do
      expect(response).to have_http_status(200)
    end

    it 'returns an correct id' do
      expect(json['data']['id']).to eq(meditations[0].id.to_s)
    end
  end

  describe 'GET /meditations/my' do
    before {
      get '/meditations/my',
      params: {},
      headers: headers
    }

    it 'returns an ok status' do
      expect(response).to have_http_status(200)
    end

    it 'returns an correct total' do
      expect(json['meta']['total']).to eq(2)
    end
  end
end
