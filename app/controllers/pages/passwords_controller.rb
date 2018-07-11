class Pages::PasswordsController < Pages::BaseController
  def recovery
    begin
      decoded_auth_token(params[:token])
      session[:token] = params[:token]
      @user = User.new
    rescue ExceptionHandler::InvalidToken
      render :invalid_token
    end
  end

  def update
    begin
      auth = decoded_auth_token(session[:token])
      @user = User.find(auth[:user_id])

      if @user.update_attributes(user_params)
        session[:token] = nil
        render :success
      else
        render :recovery
      end
    rescue ExceptionHandler::InvalidToken
      render :invalid_token
    end
  end

  private

  def decoded_auth_token(token)
    JsonWebToken.decode(token)
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
