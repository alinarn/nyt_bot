bot: bundle exec ruby lib/nyt_bot.rb
api_worker: bundle exec sidekiq -r ./lib/nyt_bot/api_worker.rb
notification_handler: bundle exec sidekiq -r ./lib/nyt_bot/notification_handler.rb