
require "rails_helper"

RSpec.describe "GET /api/v1/items/:id", :type => :request do

  it "returns a single item,containing name, description, image_url only" do
    3.times do |n|
      Item.create(name: "Tone_Loc ##{n}", description: "Funky Cold Medina #{n} times", image_url: "http://images.45cat.com/tone-loc-funky-cold-medina-delicious-vinyl-2.jpg")
    end
    item = Item.last

    get "/api/v1/items/#{item.id}"

    expect(response.status).to eq 200
    item_info = JSON.parse(response.body, symbolize_names: true)

    expect(item_info[:name]).to eq "Tone_Loc #2"
    expect(item_info[:description]).to eq "Funky Cold Medina 2 times"
    expect(item_info[:image_url]).to eq "http://images.45cat.com/tone-loc-funky-cold-medina-delicious-vinyl-2.jpg"
    expect(item_info[:created_at]).to be_nil
    expect(item_info[:updated_at]).to be_nil
  end
end

# When I send a GET request to /api/v1/items/1
# I receive a 200 JSON response containing the name, description,
# and image_url but not the created_at or updated_at
