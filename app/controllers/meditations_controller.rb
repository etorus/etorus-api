class MeditationsController < ApplicationController
  def index
    meditations = Meditation.includes(:user).public_sessions

    json_response(MeditationSerializer.new(
      meditations, { meta: { total: meditations.size } }
    ).serializable_hash)
  end

  private

  def meditation_params
    params.permit(
      :title,
      :audio,
      :start,
      :public_sessions,
    )
  end
end
