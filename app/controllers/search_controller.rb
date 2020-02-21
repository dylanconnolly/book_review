class SearchController < ApplicationController

  def index
    service = OpenLibraryService.new
    api_data = service.get_book_by_title(params[:title])

    render locals: {
      book: Book.new(api_data),
      search_input: params[:title]
    }
  end
end
