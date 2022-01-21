require 'net/http'

class ApiData

  def self.get
    http = Net::HTTP.new("api.nytimes.com")
    request = Net::HTTP::Get.new('/svc/movies/v2/reviews/search.json?reviewer=Ben%20Kenigsberg&api-key=2A8qcJmU85f5t3RGcoOkBhGoXkXvKYYs')
    response = http.request(request)
    response.body
  end
end