require 'rails_helper'

RSpec.describe 'Notifications API', type: :request do
  let(:user) { create :user }
  let(:meditation) { create :meditation }
  let(:headers) { valid_headers }
  let!(:notifications) { create_list :notification, 2, user: user }

  describe 'GET /notifications' do
    before { get '/notifications', params: {}, headers: headers }

    it 'returns an ok status' do
      expect(response).to have_http_status(200)
    end

    it 'returns an correct total' do
      expect(json['meta']['total']).to eq(2)
    end
  end

  describe 'POST /notifications' do
    before {
      post '/notifications',
      params: {
        user_id: user.id,
        meditation_id: meditation.id,
        translation_key: 'translation_key',
        uuid: '90909090909090909090909090909090'
      }.to_json,
      headers: headers
    }

    it 'returns an created status' do
      expect(response).to have_http_status(201)
    end

    it 'returns an correct total' do
      expect(json['data']['type']).to eq('notification')
    end

    it 'returs the correct meditation_id' do
      expect(json['data']['attributes']['meditation_id']).to eq(meditation.id)
    end

    it 'returs the correct user_id' do
      expect(json['data']['attributes']['user_id']).to eq(user.id)
    end
  end
end
