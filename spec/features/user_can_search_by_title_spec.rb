require 'rails_helper'

RSpec.describe "as a user" do
  it "I can enter a book title and click search and see info about that book" do

    visit root_path

    fill_in :title, with: "the man who saw everything"

    click_button "Find Book"

    expect(current_path).to eq('/search')

    expect(page).to have_content("The Man Who Saw Everything")
    expect(page).to have_content("Deborah Levy")
  end

  it "when I search for a book by title I also see reviews from the NYT for that book" do
    visit root_path

    fill_in :title, with: "the man who saw everything"

    click_button "Find Book"

    expect(current_path).to eq('/search')

    expect(page).to have_css('#reviews')
    within('#reviews') do
      expect(first('.review')).to have_css('.summary')
      expect(first('.review')).to have_css('.date')
    end

    expect(page).to have_css('.review', count: 2)
  end
end


# I should also see:
# - This book has 2 reviews from the New York Times
#   (Note: reviews are the "summary" in the book review response)
# - Review 1: ""The Man Who Saw Everything,"" which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at "authoritarian old men.""
# Review Publication Date: 2019-10-09
# - Review 2: "Deborah Levy's latest novel, "The Man Who Saw Everything," experiments with time travel, history and the endless complications of love."
# Review Publication Date: 2019-10-15```



# When I visit "/"
# And I input "the man who saw everything" into the form
# (Note: Use the existing search form)
# And I click "Find Book"
# Then I should be on page "/search"
# Then I should see the book's info
# For that book I should see
# - Title
# - Author
# - Genres
# (Note: genres is referred to as "subjects" in the book search response)
