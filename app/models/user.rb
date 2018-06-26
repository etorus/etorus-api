class User < ApplicationRecord
  has_many :meditations
  has_many :notifications

  has_secure_password
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email
end
