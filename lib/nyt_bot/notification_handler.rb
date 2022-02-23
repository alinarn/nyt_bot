require 'sidekiq'
require 'sidekiq-scheduler'
require 'date'
require_relative 'bot'

class NotificationHandler
  include Sidekiq::Worker
  
  def perform
    data = Redis.current.get('data')
    date_match = data.match(/\d{2} .* \d{4}/).to_s
    date_published = Date.parse(date_match)
    if date_published == Date.today
      Bot.send_notification(data)
    end
  end
end