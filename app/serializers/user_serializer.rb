class UserSerializer
  include FastJsonapi::ObjectSerializer

  set_type :user

  attributes :email, :name, :facebook_id, :avatar, :phone
  has_many :meditations
end
