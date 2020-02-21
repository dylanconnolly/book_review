class Book
  attr_reader :title, :author, :genres

  def initialize(api_data)
    @title = api_data[:docs].first[:title]
    @author = api_data[:docs].first[:author_name]
    @genres = api_data[:docs].first[:subject]
  end
end
