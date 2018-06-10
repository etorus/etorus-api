class MeditationSerializer
  include FastJsonapi::ObjectSerializer

  set_type :meditation
  belongs_to :user

  attributes :title, :audio, :start, :session_public

  attribute :lobby do |object|
    User.find(object.lobby).map do |user|
      { avatar: user.avatar, name: user.name }
    end
  end
end
