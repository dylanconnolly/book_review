class SearchResultsFacade
  attr_reader :book_title

  def initialize(book_title)
    @book_title = book_title
  end

  def book
    return @book if @book
    library_service = OpenLibraryService.new
    book_api_data = library_service.get_book_by_title(@book_title)

    @book = Book.new(book_api_data)
  end

  def reviews
    nyt_service = NytBooksService.new
    reviews_data = nyt_service.get_reviews_by_title(@book_title)[:results]

    reviews_data.map do |data|
      Review.new(data)
    end
  end

end
