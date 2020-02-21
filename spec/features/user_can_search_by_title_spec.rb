require 'rails_helper'

RSpec.describe "as a user" do
  it "I can enter a book title and click search and see info about that book" do

    visit root_path

    fill_in :title, with: "the man who saw everything"

    click_button "Find Book"

    expect(current_path).to eq('/search')

    expect(page).to have_content("The Man Who Saw Everything")
    expect(page).to have_content("Deborah Levy")
    expect(page).to have_content
  end
end




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
