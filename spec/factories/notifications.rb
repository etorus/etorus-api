FactoryBot.define do
  factory :notification do
    translation_key '123123'
    uuid '123123'

    user
    meditation
  end
end
