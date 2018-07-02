class Meditation < ApplicationRecord
  belongs_to :user
  has_many :notifications

  validates_presence_of :title, :audio, :start

  default_scope { order(start: :asc) }

  scope :public_sessions, -> { where(session_public: true) }
  scope :actual_sessions, -> {
    where(start: Time.now..(Time.now.midnight + 4.days))
  }
end
