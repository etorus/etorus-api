require 'rails_helper'

RSpec.describe AuthenticateFacebook do
  let(:token) { 'EAAOBf4WLaNsBALdrz8ybACZAdvyZBcmNyZBf6jdR6wXHuvwDxAthIZB2cXcqPYyVvmr8EnJS0UMZA5TOevfwbBKiOGaXN76tMbDYd4jcmUGa0kEhxjZCTtPqpa8EhmIMfCUIL1LgB8xeheBVo84JKb0gRKst2cRkQMjSFTJmgi42RY3KUjRmrFnEAL6MC8PDHFPPaJTQnqEkTrVUwwZBPISjpp1UhQcVt5SORnbp6BZBTAZDZD' }
  let!(:user) { create(:user, facebook_id: '131637811018008') }
  subject(:invalid_auth_obj) { described_class.new('abcdef') }

  describe '#call' do
    context 'when valid credentials', vcr: true do
      subject do
        described_class.new(token).call
      end

      it 'returns an auth token' do
        expect(subject[:auth_token]).not_to be_nil
      end

      it 'returns an user' do
        expect(subject[:user]).not_to be_nil
      end
    end

    context 'when invalid credentials', vcr: true do
      it 'raises an authentication error' do
        expect { described_class.new('abcdef').call }.to raise_error(
          ExceptionHandler::AuthenticationError,
          /Invalid credentials/
        )
      end
    end
  end
end
