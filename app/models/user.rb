class User < ApplicationRecord
  has_many :meditations

  has_secure_password
  validates_presence_of :name, :email, :password_digest
end
