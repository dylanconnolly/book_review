class OpenLibraryService

def get_book_by_title(title)
  get_json("search.json?title=#{title}")
end

  private
    def conn
      Faraday.new("https://openlibrary.org/") do |f|
      end
    end

    def get_json(uri)
      response = conn.get(uri)

      JSON.parse(response.body, symbolize_names: true)
    end
end
