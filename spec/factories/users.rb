FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'foobar'
    password_confirmation 'foobar'
    facebook_id '12345678'
  end
end
