require 'rails_helper'

describe MeditationSeed do
  describe '.call' do
    let(:beginning_seed) { DateTime.now.beginning_of_day }
    let(:end_seed) { DateTime.now.end_of_day }

    it 'create the correct number of meditations to an entire day' do
      actual = described_class.(beginning_seed: beginning_seed, end_seed: end_seed)

      expect(actual.size).to equal(48)
    end
  end
end
