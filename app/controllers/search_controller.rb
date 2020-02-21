class SearchController < ApplicationController

  def index
    library_service = OpenLibraryService.new
    book_api_data = library_service.get_book_by_title(params[:title])

    nyt_service = NytBooksService.new
    reviews_data = nyt_service.get_reviews_by_title(params[:title])[:results]

    render locals: {
      book: Book.new(book_api_data),
      search_input: params[:title],
      reviews: reviews_data.map do |data|
                  Review.new(data)
                end
    }
  end
end
