require 'rails_helper'

describe "BestbuyService" do
  context "stores_by_zip" do
    it "returns stores for given zip code" do
      VCR.use_cassette("#stores_by_zip") do
        stores_by_zip = BestbuyService.new.stores_by_zip("80202")
        store1 = stores_by_zip.first

        expect(stores_by_zip).to be_an(Array)
        expect(store1).to be_a(Hash)
        expect(store1).to have_key(:longName)
        expect(store1).to have_key(:city)
        expect(store1).to have_key(:distance)
        expect(store1).to have_key(:phone)
        expect(store1).to have_key(:storeType)

      end
    end
  end
end
