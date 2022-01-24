require 'sidekiq'
require 'sidekiq-scheduler'
require_relative 'api'

class ApiWorker
  include Sidekiq::Worker

  def perform
    ApiData.send_get_request
  end
end
