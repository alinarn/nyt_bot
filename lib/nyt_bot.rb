require_relative 'nyt_bot/api'
require_relative 'nyt_bot/bot'
require_relative 'nyt_bot/parser'
require 'dotenv'
Dotenv.load('../token.env')

BOT_TOKEN = ENV['TELEGRAM_TOKEN']
API_KEY = ENV['API_KEY']
data = ApiData.get(API_KEY)
formatted_data = DataFormatter.parse(data)
tg_bot = Bot.new(formatted_data, BOT_TOKEN)
tg_bot.run
