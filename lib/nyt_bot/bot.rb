require 'telegram/bot'
require 'redis'
require 'dotenv'
Dotenv.load('../../token.env')

class Bot
  attr_reader :data

  def initialize(data)
    @data = data
  end

  TOKEN = ENV['TELEGRAM_TOKEN']
  BOT = Telegram::Bot::Client.new(TOKEN)

  def run
    BOT.run do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(
            chat_id: message.chat.id,
            text: "hey, #{message.from.first_name}! welcome"
            )
        when '/data'
          bot.api.send_message(
            chat_id: message.chat.id,
            text: "#{data.pretty_print.join}",
            )
        end
        store_chat_id(message.chat.id)
      end
    end
  end

  def self.send_notification
    chat_id = Redis.current.get('chat_id')
    BOT.api.send_message(chat_id: chat_id, text: "notification")
  end

  private

  def store_chat_id(chat_id)
   Redis.current.set('chat_id', chat_id)
  end
end
