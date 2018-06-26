class NotificationsController < ApplicationController
  def index
    notifications = current_user.notifications
    options = { meta: { total: notifications.size } }
    response = NotificationSerializer
      .new(notifications, options)
      .serializable_hash

    json_response(response)
  end

  def create
    notification = Notification.create!(notification_params.merge({
      user_id: current_user.id
    }))
    response = NotificationSerializer.new(notification).serializable_hash

    json_response(response, :created)
  end

  private

  def notification_params
    params.permit(
      :uuid,
      :meditation_id,
      :translation_key
    )
  end
end
