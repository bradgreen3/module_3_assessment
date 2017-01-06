require 'rails_helper'

describe "a user who searches for a store" do
  it "sees appropriate information returned" do
    VCR.use_cassette("#bestbuyfeature") do

    visit '/'

    fill_in "zip", with: "80202"

    click_on "Search"

    expect(current_path).to eq(search_path)

    end
  end
end
