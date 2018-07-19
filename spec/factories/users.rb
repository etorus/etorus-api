FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'foobar'
    password_confirmation 'foobar'
    facebook_id { Faker::Number.number(8) }
  end
end
