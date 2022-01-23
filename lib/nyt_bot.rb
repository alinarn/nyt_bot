require_relative 'nyt_bot/api'
require_relative 'nyt_bot/bot'
require_relative 'nyt_bot/parser'
require_relative 'nyt_bot/presenter'
require 'dotenv'
Dotenv.load('../token.env')

BOT_TOKEN = ENV['TELEGRAM_TOKEN']
API_KEY = ENV['API_KEY']
data = ApiData.get(API_KEY)
formatted_data = DataFormatter.parse(data)
pretty_data = DataPresenter.new(formatted_data)
tg_bot = Bot.new(pretty_data, BOT_TOKEN)
tg_bot.run
