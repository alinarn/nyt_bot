require 'telegram/bot'

class Bot
  attr_reader :data, :token

  def initialize(data, token)
    @data = data
    @token = token
  end

  def run
    Telegram::Bot::Client.run(token) do |bot|
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
            text: "#{data.pretty_print.join}")  
        end
      end
    end
  end
end