require 'date'

class DataPresenter
  attr_reader :movie_reviews

  def initialize(movie_reviews)
    @movie_reviews = movie_reviews
  end

  def pretty_print
    movie_reviews.map do |review|
      <<~MESSAGE
        #{review[:title]} #{critics_pick?(review[:critics_pick])}
        #{review[:summary]}
        review published on: #{format_date(review[:publication_date])}
        view here: #{review[:link]}\n 
      MESSAGE
    end
  end

  private
    def critics_pick?(element)
      return '(critics pick!)' if element == 1
    end

    def format_date(date)
      Date.parse(date).strftime('%-d %B %Y')
    end
end
