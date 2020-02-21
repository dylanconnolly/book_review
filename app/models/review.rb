class Review
  attr_reader :summary, :publication_date

  def initialize(api_data)
    @summary = api_data[:summary]
    @publication_date = api_data[:publication_dt]
  end
end
