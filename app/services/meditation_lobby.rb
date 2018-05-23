class MeditationLobby
  ENTER = :enter
  LEAVE = :leave

  def initialize(action, meditation_id, user_id)
    @action = action
    @meditation_id = meditation_id
    @user_id = user_id
  end

  def self.call(action:, meditation_id:, user_id:)
    new(action, meditation_id, user_id).trigger
  end

  def trigger
    new_lobby = LobbyControl.(
      action: action,
      meditation_id: meditation_id,
      user_id: user_id
    )

    release_pusher(new_lobby)
    new_lobby
  end

  private
  attr_reader :action, :meditation_id, :user_id

  def release_pusher(lobby)
    Pusher.trigger("MEDITATION_LOBBY#{meditation_id}", 'session:bell', {
      lobby: lobby
    })
  end
end
