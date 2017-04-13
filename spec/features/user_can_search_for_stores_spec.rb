require 'rails_helper'

feature 'User can search for stores' do
  it 'by the zip code' do
    VCR.use_cassette('80020') do
      expected_stores = BestBuy.stores("80202")

      visit root_path

      fill_in "search[zip_code]", with: "80202"
      click_on "Search"

      expect(current_path).to eq(search_index_path)

      expect(page).to have_content("16 Total Stores")
      expect(page).to have_selector('tr.store', count: 10)
      expected_stores.each do |store|
        within("#store-#{store.id}") do
          expect(page).to have_content(store.name)
          expect(page).to have_content(store.city)
          expect(page).to have_content(store.distance)
          expect(page).to have_content(store.phone)
          expect(page).to have_content(store.store_type)
        end
      end
    end
  end
end
