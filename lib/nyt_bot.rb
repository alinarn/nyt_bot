require_relative 'nyt_bot/api'
require_relative 'nyt_bot/bot'
require_relative 'nyt_bot/parser'
require 'dotenv'
Dotenv.load('../token.env')

BOT_TOKEN = ENV['TELEGRAM_TOKEN']
data = ApiData.get
formatted_data = DataFormatter.parse(data)
Bot.run(BOT_TOKEN)
