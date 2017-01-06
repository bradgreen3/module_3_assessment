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
      expect(items.last.keys).to contain_exactly('id', 'name', 'description', 'image_url')
      end
    end
    context "GET /items/:id" do
      it "returns specified item" do
        item1 = Item.create(name: "Test item", description: "An item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200" )
        item2 = Item.create(name: "Test item2", description: "Another item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200" )

        get "/api/v1/items/#{item1.id}"

        json_item = JSON.parse(response.body)

        expect(response).to be_success
        expect(json_item["name"]).to eq("Test item")
        expect(json_item["description"]).to eq("An item used for testing")
        expect(json_item["image_url"]).to eq("http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
        expect(json_item.keys).to contain_exactly('id', 'name', 'description', 'image_url')
      end
    end
  end
