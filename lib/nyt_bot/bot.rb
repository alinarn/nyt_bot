require 'telegram/bot'

class Bot

  def self.run(token)
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(
            chat_id: message.chat.id,
            text: "hey, #{message.from.first_name}! welcome"
            )
        end
      end
    end
  end
end