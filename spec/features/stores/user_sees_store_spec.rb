require 'rails_helper'

describe "user clicks on store" do
  xit "sees info about that store" do
    VCR.use_cassette("#showstore") do

    visit '/'

    fill_in "zip", with: "80202"

    click_on "Search"

    # When I click the name of a store

    expect(current_path).to eq(stores_path(store.id))

    # I should see the store name, store type and address with city, state and zip
    # I should see an unordered list of the store hours in the following format:
    end
  end
end
