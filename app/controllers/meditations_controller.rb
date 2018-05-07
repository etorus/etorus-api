class MeditationsController < ApplicationController
  def index
    meditations = Meditation.includes(:user).public_sessions

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
