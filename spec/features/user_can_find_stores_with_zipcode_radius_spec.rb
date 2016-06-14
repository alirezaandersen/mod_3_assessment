require 'rails_helper'

# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results

RSpec.feature "Use can search zipcode and find store within radious" do
  scenario "they can search for store by zipcode" do

    visit "/"

    fill_in "search by zipcode", with: "80202"
    fill_in "raidious", with: "25"
    VCR.use_cassette("best_buy_service#search_stores") do
    click_on "search"

    expect(current_path).to eq "/search"
    #binding.pry
    expect(page).to have_content "17 Total Stores"
    expect(page).to have_content "Long Name:Best Buy Mobile - Cherry Creek Shopping Center"
    expect(page).to have_content "Address: 3000 East First Ave"
    expect(page).to have_content "City: Denver"
    expect(page).to have_content "Distance: 3.25"
    expect(page).to have_content "Phone Number: 303-270-9189"
    expect(page).to have_content "Hours: Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-9; Sat: 10-9; Sun: 11-6"
    expect(page).to have_content "Store Type: Mobile"
  end
end
end
