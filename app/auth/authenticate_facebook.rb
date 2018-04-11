class AuthenticateFacebook
  def initialize(access_code)
    @access_code = access_code
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

  attr_reader :access_code

  def user
    User.find_by(facebook_id: authenticate['id'])
  end

  def authenticate
    begin
      graph.get_object('me')
    rescue Koala::Facebook::AuthenticationError
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end

  def graph
    Koala::Facebook::API.new(access_code)
  end
end
