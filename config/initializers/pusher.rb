require 'pusher'

Pusher.app_id = ENV['APP_ID_PUSHER']
Pusher.key = ENV['APP_KEY_PUSHER']
Pusher.secret = ENV['SECRET_PUSHER']
Pusher.cluster = 'us2'
Pusher.logger = Rails.logger
Pusher.encrypted = true
