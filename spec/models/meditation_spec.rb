require 'rails_helper'

RSpec.describe Meditation, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:audio) }
  it { should validate_presence_of(:start) }
end
