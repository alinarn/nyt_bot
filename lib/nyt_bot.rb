require_relative 'nyt_bot/api'
require_relative 'nyt_bot/bot'
require_relative 'nyt_bot/parser'
require_relative 'nyt_bot/presenter'
require_relative 'nyt_bot/worker'
require 'sidekiq'
require 'redis'
require 'dotenv'
Dotenv.load('../token.env')

data = ApiData.get('raw_data')
formatted_data = DataFormatter.parse(data)
pretty_data = DataPresenter.new(formatted_data)
tg_bot = Bot.new(pretty_data)
tg_bot.run
