class Pages::PasswordsController < Pages::BaseController
  def recovery
  end

  def password_params
    params.permit(:token, :password, :password_confirmation)
  end
end
