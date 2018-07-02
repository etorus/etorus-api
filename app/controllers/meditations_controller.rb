class MeditationsController < ApplicationController
  def index
    meditations = Rails.cache.fetch("meditations/public", expires_in: 10.minutes) do
      Meditation.includes(:user).public_sessions.actual_sessions
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
      user_id: current_user.id
    )

    json_response(
      MeditationSerializer
        .new(meditation, {
          include: [:user]
        })
        .serializable_hash
    )
  end

  def my
    meditations = current_user.notifications.map(&:meditation)

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

  def leave
    lobby = MeditationLobby.(
      action: MeditationLobby::LEAVE,
      meditation_id: meditation.id,
      user_id: current_user.id
    )

    json_response(
      MeditationSerializer
        .new(meditation, {
          include: [:user]
        })
        .serializable_hash
    )
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
