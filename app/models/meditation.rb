class Meditation < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :audio, :start

  default_scope { order(start: :asc) }

  scope :public_sessions, -> { where(session_public: true) }
end
