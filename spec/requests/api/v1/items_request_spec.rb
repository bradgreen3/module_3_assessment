require 'rails_helper'

describe "items endpoint" do
  context "GET /items" do
    it "returns all items" do
      Item.create(name: "Test item", description: "An item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200" )
      Item.create(name: "Test item2", description: "Another item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200" )
      Item.create(name: "Test item3", description: "Yet another item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200" )

      get "/api/v1/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(3)
      expect(items.last["name"]).to eq("Test item3")
      expect(items.last["description"]).to eq("Yet another item used for testing")
      expect(items.last["image_url"]).to eq("http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
      end
    end
  end
