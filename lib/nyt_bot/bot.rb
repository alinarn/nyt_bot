require 'telegram/bot'
require_relative 'services/redis_saver'
require 'dotenv'
Dotenv.load('../../token.env')

class Bot
  attr_reader :data

  def initialize(data)
    @data = data
    RedisSaver.call('data', @data.pretty_print.first)
  end

  TOKEN = ENV['TELEGRAM_TOKEN']
  BOT = Telegram::Bot::Client.new(TOKEN)

  def run
    BOT.run do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          welcome_message = <<~MESSAGE
            Hey, #{message.from.first_name}!
            From now on, I'm gonna send you the latest movie reviews by Ben Kenigsberg.
            If you want to view recent 10 reviews type /reviews
          MESSAGE
          bot.api.send_message(
            chat_id: message.chat.id,
            text: welcome_message
          )
        when '/reviews'
          bot.api.send_message(
            chat_id: message.chat.id,
            text: "#{data.pretty_print.take(10).join}",
            parse_mode: 'HTML'
          )
        end
        store_chat_id(message.chat.id)
      end
    end
  end

  def self.send_notification(message)
    chat_id = Redis.current.get('chat_id')
    BOT.api.send_message(
      chat_id: chat_id,
      text: message,
      parse_mode: 'HTML'
    )
  end

  private

  def store_chat_id(chat_id)
    RedisSaver.call('chat_id', chat_id)
  end
end
