class NotificationSerializer
  include FastJsonapi::ObjectSerializer
  set_type :notification

  attributes :user_id, :meditation_id, :translation_key, :uuid
end
