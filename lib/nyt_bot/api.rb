require 'net/http'
require_relative 'services/redis_saver'
require 'dotenv'
Dotenv.load('../../token.env')

class ApiData
  
  API_KEY = ENV['API_KEY']

  class << self 
    def send_get_request
      make_api_call
    end

    def get(redis_key)
      get_data_from_redis(redis_key)
    end

    private

    def make_api_call
      http = Net::HTTP.new("api.nytimes.com")
      request = Net::HTTP::Get.new("/svc/movies/v2/reviews/search.json?reviewer=Ben%20Kenigsberg&api-key=#{API_KEY}")
      response = http.request(request)
      RedisSaver.call('raw_data', response.body)
    end

    def get_data_from_redis(redis_key)
      Redis.current.get(redis_key)
    end
  end
end
