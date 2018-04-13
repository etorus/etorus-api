FactoryBot.define do
  factory :meditation do
    title          { Faker::Movie.quote }
    start          { Faker::Time.forward(1, :morning) }
    audio          'audio_pt'
    session_public true

    user
  end
end
