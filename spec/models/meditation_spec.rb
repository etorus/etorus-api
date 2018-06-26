require 'rails_helper'

RSpec.describe Meditation, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:notifications) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:audio) }
  it { should validate_presence_of(:start) }

  describe '.public' do
    let(:public_meditations) { create_list :meditation, 2 }
    let!(:private_meditations) { create_list :meditation, 1, session_public: false }

    it 'returns the public meditations' do
      expect(described_class.public_sessions).to eq(public_meditations.reverse)
    end
  end
end
