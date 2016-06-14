# require 'rails_helper'
#
# RSpec.feature "Use can get information for a specific store" do
#   scenario "they can see store info" do
#
#     visit "/"
#
#     fill_in "search by zipcode", with: "80202"
#     fill_in "raidious", with: "25"
#     click_on "search"
#
#     # click_link on first item
#     # expect(current_path).to eq "/search"
#     # #binding.pry
#     # expect(page).to have_content "17 Total Stores"
#     # expect(page).to have_content "Long Name:Best Buy Mobile - Cherry Creek Shopping Center"
#     # expect(page).to have_content "Address: 3000 East First Ave"
#     # expect(page).to have_content "City: Denver"
#     # expect(page).to have_content "Distance: 3.25"
#     # expect(page).to have_content "Phone Number: 303-270-9189"
#     # expect(page).to have_content "Hours: Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-9; Sat: 10-9; Sun: 11-6"
#     # expect(page).to have_content "Store Type: Mobile"
# # As a user
# # After I have searched a zip code for stores
# # When I click the name of a store
# # Then my current path should be "/stores/:store_id"
# # I should see the store name, store type and address with city, state and zip
# # I should see an unordered list of the store hours in the following format:
# #   * Mon: 10am-9pm
# #   * Tue: 10am-9pm
# #   * Wed: 10am-9pm
# #   * Thurs: 10am-9pm
# #   * Fri: 10am-9pm
# #   * Sat: 10am-9pm
# #   * Sun: 11am-7pm
