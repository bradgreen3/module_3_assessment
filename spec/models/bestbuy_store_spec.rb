require 'rails_helper'

describe "Bestbuy" do
  it "returns an array of forecasts" do
    VCR.use_cassette("#bestbuy_model") do

    store = Bestbuy.stores_by_zip("80202").first

    expect(store).to respond_to(:long_name)
    expect(store).to respond_to(:city)
    expect(store).to respond_to(:distance)
    expect(store).to respond_to(:phone)
    expect(store).to respond_to(:store_type)

    end
  end
end
