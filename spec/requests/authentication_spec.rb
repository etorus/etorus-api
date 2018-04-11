require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST auth/login' do
    let(:user) { create(:user) }
    let(:headers) { valid_headers.except('Authorization') }
    let(:valid_credentials) do
      {
        email: user.email,
        password: user.password
      }.to_json
    end
    let(:invalid_credentials) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end

    context 'When request is valid' do
      before { post '/auth/login', params: valid_credentials, headers: headers }

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end

      it 'returns an authenticated user' do
        expect(json['user']).not_to be_nil
      end
    end

    context 'When request is invalid' do
      before { post '/auth/login', params: invalid_credentials, headers: headers }

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end

  describe 'POST auth/facebook' do
    let!(:user) { create(:user, facebook_id: '131637811018008') }
    let(:headers) { valid_headers.except('Authorization') }
    let(:valid_credentials) do
      {
        access_code: 'EAAOBf4WLaNsBAB7bEJDkZANJ1GcuGBc5LkEXW7DYCeMimzzSADDw0o2Cv2yPLbeusI79Qlec2fuBtIZCoYGIZCZAP7IJvqj2lBblSxjpLqC2mY7imXhaEy43cPGD9KjHK56UKQuwJABKvm7GZA9KiwzQNWZAbQEd2gxR6er0uDZCNgJTC68f0zZAWxFsoZBpY0CDLAHgtKq7RRI9kl5ZCJ8aTwV4UHX5JRUejZBaRQr7QrqaQZDZD'
      }.to_json
    end
    let(:invalid_credentials) do
      {
        access_code: 'invalid_access_code'
      }.to_json
    end

    context 'When request is valid', vcr: true do
      before { post '/auth/facebook', params: valid_credentials, headers: headers }

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end

      it 'returns an authenticated user' do
        expect(json['user']).not_to be_nil
      end
    end

    context 'When request is invalid', vcr: true do
      before { post '/auth/login', params: invalid_credentials, headers: headers }

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
