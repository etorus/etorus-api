class PasswordsController < ApplicationController
  skip_before_action :authorize_request, only: [:reset]

  def reset
    PasswordReset.(email: password_params[:email]).deliver

    json_response({}, :ok)
  end

  def password_params
    params.permit(:email)
  end
end
