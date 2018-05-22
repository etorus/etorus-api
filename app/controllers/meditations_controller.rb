class MeditationsController < ApplicationController
  def index
    meditations = Rails.cache.fetch("meditations/public", expires_in: 24.hours) do
      Meditation.includes(:user).public_sessions
    end

    json_response(
      MeditationSerializer
        .new(meditations, {
          meta: {
            total: meditations.size
          },
          include: [:user]
        })
        .serializable_hash
    )
  end

  def show
    json_response(
      MeditationSerializer
        .new(meditation, {
          include: [:user]
        })
        .serializable_hash
    )
  end

  def enter
    lobby = MeditationLobby.(
      action: MeditationLobby::ENTER,
      meditation_id: meditation.id,
      user: current_user
    )

    json_response({ data: { lobby: lobby } })
  end

  def leave
    lobby = MeditationLobby.(
      action: MeditationLobby::LEAVE,
      meditation_id: meditation.id,
      user: current_user.id
    )

    json_response({ data: { lobby: lobby } })
  end

  private

  def meditation
    Meditation
      .includes(:user)
      .find(
        params[:id] || meditation_params[:id]
      )
  end

  def meditation_params
    params.permit(
      :id,
      :title,
      :audio,
      :start,
      :public_sessions,
    )
  end
end
