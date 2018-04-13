class Meditation < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :audio, :start
end
