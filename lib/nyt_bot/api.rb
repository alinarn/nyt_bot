require 'net/http'

class ApiData

  def self.get(api_key)
    http = Net::HTTP.new("api.nytimes.com")
    request = Net::HTTP::Get.new("/svc/movies/v2/reviews/search.json?reviewer=Ben%20Kenigsberg&api-key=#{api_key}")
    response = http.request(request)
    response.body
  end
end