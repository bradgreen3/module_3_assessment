require 'rails_helper'

describe "a user who searches for a store" do
  it "sees appropriate information returned" do
    VCR.use_cassette("#bestbuyfeature") do

  visit '/'

  fill_in "zip", with: "80202"

  click_on "Search"

  expect(current_path).to eq(search_path)
  # expect(page).to have_content('all the stores within 25 miles')
  # expect(page).to have_content('message saying: 16 total stores')
  # expect(page).to have_content('there to be exactly 16 stores on the page')
  # expect(page).to have_content('long name, city, distance, phone number and store type for each of the 16 results')
    end
  end
end
