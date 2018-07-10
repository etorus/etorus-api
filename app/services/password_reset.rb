class PasswordReset
  def initialize(email)
    @email = email
  end

  def self.call(email:)
    new(email).reset
  end

  def reset
    user = User.find_by(email: email)

    raise(ExceptionHandler::InvalidEmail, Message.invalid_email) if user.nil?

    token = JsonWebToken.encode({ user_id: user.id }, 1.hour.from_now)
    PasswordMailer.with(user: user, token: token).reset
  end

  private
  attr_accessor :email
end
