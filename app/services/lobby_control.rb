class LobbyControl
  def initialize(meditation_id, user_id, action)
    @meditation_id = meditation_id
    @user_id = user_id
    @action = action
  end

  def self.call(meditation_id:, user_id:, action:)
    new(meditation_id, user_id, action).update_lobby
  end

  def update_lobby
    session = meditation
    current_lobby = updated_lobby(session.lobby).map(&:to_s)
    session.update(lobby: current_lobby)

    current_lobby
  end

  private
  attr_reader :meditation_id, :user_id, :action

  def updated_lobby(lobby)
    return put_user(lobby) if action == MeditationLobby::ENTER
    return take_user(lobby) if action == MeditationLobby::LEAVE

    lobby
  end

  def take_user(lobby)
    (lobby || []) - [user_id.to_s]
  end

  def put_user(lobby)
    (lobby || []) | [user_id.to_s]
  end

  def meditation
    Meditation.find(meditation_id)
  end
end
