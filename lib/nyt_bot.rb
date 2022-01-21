require_relative 'nyt_bot/api'
require_relative 'nyt_bot/bot'
require 'dotenv'
Dotenv.load('../token.env')

BOT_TOKEN = ENV['TELEGRAM_TOKEN']
data = ApiData.get
Bot.run(BOT_TOKEN)