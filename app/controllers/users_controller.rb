class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    user = User.create!(user_params)
    authenticate_user = AuthenticateUser.new(user.email, user.password).call

    response = {
      message: Message.account_created,
      auth_token: authenticate_user[:auth_token],
      user: UserSerializer.new(user).serializable_hash
    }

    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :facebook_id,
      :avatar,
      :phone,
    )
  end
end
