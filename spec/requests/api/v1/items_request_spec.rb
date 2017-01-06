require 'rails_helper'

describe "items endpoint" do
  context "GET /items" do
    it "returns all items" do
      Item.create(name: "Test item", description: "An item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200" )
      Item.create(name: "Test item2", description: "Another item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200" )
      Item.create(name: "Test item3", description: "Yet another item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200" )

      get "/api/v1/items"

      items = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(items.count).to eq(3)
      expect(items.last["name"]).to eq("Test item3")
      expect(items.last["description"]).to eq("Yet another item used for testing")
      expect(items.last["image_url"]).to eq("http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
      expect(items.last.keys).to contain_exactly('id', 'name', 'description', 'image_url')
      end
    end
    context "GET /items/:id" do
      it "returns specified item" do
        item1 = Item.create(name: "Test item", description: "An item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
        item2 = Item.create(name: "Test item2", description: "Another item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")

        get "/api/v1/items/#{item1.id}"

        json_item = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json_item["name"]).to eq("Test item")
        expect(json_item["description"]).to eq("An item used for testing")
        expect(json_item["image_url"]).to eq("http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
        expect(json_item.keys).to contain_exactly('id', 'name', 'description', 'image_url')
      end
    end
    context "DELETE /items/:id" do
      it "deletes specified item" do

        item = Item.create(name: "Test item", description: "An item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
        item2 = Item.create(name: "Test item2", description: "Another item used for testing", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")

        expect{delete "/api/v1/items/#{item.id}"}.to change(Item, :count).by(-1)

        expect(response.status).to eq(204)
        expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
    context "POST /items" do
      it "creates new item" do

        item_params = { name: "Test item",
          description: "80210",
          image_url: "Capital of Colorado" }

        post "/api/v1/items", params: {item: item_params}

        json_response_item = JSON.parse(response.body)

        expect(response.status).to eq(201)
        expect(json_response_item["name"]).to eq("Test item")
        expect(json_response_item["description"]).to eq("An item used for testing")
        expect(json_response_item["image_url"]).to eq("http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
        expect(json_response_item.keys).to contain_exactly('id', 'name', 'description', 'image_url')
      end
    end
  end
