require 'json'

class DataFormatter
  class << self
    def parse(raw_data)
      parsed_data = JSON.parse(raw_data, symbolize_names: true)
      transform_data(parsed_data)
    end

    private

      def transform_data(parsed_data)
        movie_reviews = {
          title: [],
          critics_pick: [],
          summary: [],
          publication_date: [],
          link: []
        }

        parsed_data[:results].each do |movie_hash|
          movie_reviews[:title] << movie_hash[:display_title]
          movie_reviews[:critics_pick] << movie_hash[:critics_pick]
          movie_reviews[:summary] << movie_hash[:summary_short]
          movie_reviews[:publication_date] << movie_hash[:publication_date]
          movie_reviews[:link] << movie_hash.dig(:link, :url)
        end

        keys = movie_reviews.keys
        movie_reviews.values.transpose.map { |movies| keys.zip(movies).to_h }
      end
  end
end
