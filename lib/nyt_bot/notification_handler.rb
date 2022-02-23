require 'sidekiq'
require 'sidekiq-scheduler'
require_relative 'bot'

class NotificationHandler
  include Sidekiq::Worker
  
  def perform
    data = Redis.current.get('data')
    Bot.send_notification(data)
  end
end