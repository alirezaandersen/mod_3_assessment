require "rails_helper"

RSpec.describe "GET /api/v1/items", :type => :request do

  it "returns name, description, and image for specified items. " do
    3.times do |n|
      Item.create(name: "Daft_Punk ##{n}", description: "Around the WORLD #{n} times", image_url: "https://upload.wikimedia.org/wikipedia/it/1/17/Daft_Punk,_Around_the_World_(Michel_Gondry).png")
    end

    get "/api/v1/items"

    expect(response.status).to eq 200

    items_json = JSON.parse(response.body, symbolize_names: true)
    item_info = items_json[1]

    expect(items_json.count).to eq 3
    expect(item_info[:name]).to eq "Daft_Punk #1"
    expect(item_info[:description]).to eq "Around the WORLD 1 times"
    expect(item_info[:image_url]).to eq "https://upload.wikimedia.org/wikipedia/it/1/17/Daft_Punk,_Around_the_World_(Michel_Gondry).png"
    expect(item_info[:created_at]).to be_nil
    expect(item_info[:updated_at]).to be_nil
  end

end

# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items
# And each item has a name, description, and image_url
# but not the created_at or updated_at
