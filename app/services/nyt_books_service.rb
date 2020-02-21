class NytBooksService

  def get_reviews_by_title(title)
    get_json("reviews.json?title=#{title}")
  end

  def conn
    Faraday.new('https://api.nytimes.com/svc/books/v3/') do |f|
    end
  end

  def get_json(uri)
    response = conn.get(uri + "&api-key=#{ENV['NYT_API_KEY']}")

    JSON.parse(response.body, symbolize_names: true)
  end
end
