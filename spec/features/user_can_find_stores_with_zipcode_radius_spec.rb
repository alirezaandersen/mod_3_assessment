rails 'helper'

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

    fill_in "search by zipcode" with: "80202"
    fill_in "distance", with: "25"

    click_on "search"

    expect(current_path)to. eq "/search"

    expect(page).to have_content
    expect(page).to have_content "17 Total Stores"
    expect(page).to have_content "15 results" #need to do some sort of pagination
    expect(page).to have_content "long_name:"
    expect(page).to have_content "city:"
    expect(page).to have_content "distance:"
    expect(page).to have_content "phone number:"
    expect(page).to have_content "store type:"
