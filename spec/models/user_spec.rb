require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:meditations) }
  it { should have_many(:notifications) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:password_confirmation) }

  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:facebook_id) }
end
