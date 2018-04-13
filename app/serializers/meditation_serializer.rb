class MeditationSerializer
  include FastJsonapi::ObjectSerializer

  set_type :meditation

  attributes :title, :audio, :start, :session_public
  belongs_to :user
end
