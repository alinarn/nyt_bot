require 'sidekiq'
require 'sidekiq-scheduler'
require_relative 'bot'

class NotificationHandler
  include Sidekiq::Worker
  
  def perform
    Bot.send_notification
  end
end