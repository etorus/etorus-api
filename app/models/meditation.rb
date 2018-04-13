class Meditation < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :audio, :start

  scope :public_sessions, -> { where(session_public: true) }
end
