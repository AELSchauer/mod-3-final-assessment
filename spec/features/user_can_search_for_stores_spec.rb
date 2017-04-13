require 'rails_helper'

feature 'User can search for stores' do
  it 'by the zip code' do
      # Then my current path should be "/search" (ignoring params)
      # And I should see stores within 25 miles of 80202
      # And I should see a message that says "16 Total Stores"
      # And I should see exactly 10 results
      # And I should see the long name, city, distance, phone number and store type for each of the 10 results

    visit root_path

    fill_in "search[zip_code]", with: "80202"
    click_on "Search"

    expect(current_path).to eq(search_index_path)

  end
end