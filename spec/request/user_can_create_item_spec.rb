require "rails_helper"

RSpec.describe "POST /api/v1/items/:id", :type => :request do

  it "creates a new item aka the rapper, only containing name, description, image_url" do
    payload = {name: "Notorious MSG", description: "Dim Sum Yum", image_url:"http://farm1.static.flickr.com/161/423058519_bfc954e23b_o.jpg"}
    post "/api/v1/items", payload

    expect(response.status).to eq 201
    item_info = JSON.parse(response.body, symbolize_names: true)

    expect(item_info[:name]).to eq "Notorious MSG"
    expect(item_info[:description]).to eq  "Dim Sum Yum"
    expect(item_info[:image_url]).to eq "http://farm1.static.flickr.com/161/423058519_bfc954e23b_o.jpg"
    expect(item_info[:created_at]).to be_nil
    expect(item_info[:updated_at]).to be_nil
  end
end 
# When I send a POST request to /api/v1/items with a name,
# description, and image_url I receive a 201 JSON response
# if the record is successfully created And I receive a
# JSON response containing the name, description,
# and image_url but not the created_at or updated_at
