class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: [:authenticate, :facebook]

  def authenticate
    payload =
      AuthenticateUser.new(
        auth_params[:email],
        auth_params[:password]
      ).call

    json_response(payload)
  end

  def facebook
    payload = AuthenticateFacebook.new(auth_params[:access_code]).call

    json_response(payload)
  end

  private

  def auth_params
    params.permit(:email, :password, :access_code)
  end
end
