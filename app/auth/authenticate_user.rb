class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    return payload if user
  end

  private

  def payload
    {
      auth_token: JsonWebToken.encode(user_id: user.id),
      user: user.attributes
    }
  end

  attr_reader :email, :password

  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
