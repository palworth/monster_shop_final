require 'rails_helper'
RSpec.describe "As a merchant employee", type: :feature do
  describe 'when I visit my merchant dashboard' do
    before(:each) do
      @bike_shop = Merchant.create!(name: 'Matts Bikes',
                                      address: '123 High St',
                                      city: 'Denver',
                                      state: 'CO',
                                      zip: 80210,
                                      enabled: true)
     @mike = @bike_shop.users.create!(name: "Mike",
                                      address: "124 Vine St",
                                      city: "Denver",
                                      state: "CO",
                                      zip: "80206",
                                      email: "mike@gmail.com",
                                      password: "mike",
                                      role: 2)

      @discount1 = @bike_shop.discounts.create!(title: "Bulk Discount",
                                                percent_off: 5,
                                                information: "Thanks for buying in bulk",
                                                lowest_amount: 5,
                                                highest_amount: 9)
      @discount2 = @bike_shop.discounts.create!(title: "huge Discount",
                                                percent_off: 20,
                                                information: "Thanks for buying in bulk",
                                                lowest_amount: 10,
                                                highest_amount: 19)
      @discount3 = @bike_shop.discounts.create!(title: "Giant Discount",
                                                percent_off: 25,
                                                information: "Thanks for buying in bulk",
                                                lowest_amount: 20,
                                                highest_amount: 29)
      visit "/login"
      fill_in :email, with: @mike.email
      fill_in :password, with: @mike.password
      click_button "Log In"
  end

  it "I see a link to create a new discount and make new discount" do
    expect(page).to have_link('Create New Discount')
    click_link ('Create New Discount')
    expect(current_path).to eq("/merchant/discounts/new")
    fill_in :title, with: "New Discount"
    fill_in :percent_off, with: 13
    fill_in :information, with: "This is the best discount"
    fill_in :lowest_amount, with: 30
    fill_in :highest_amount, with: nil
    click_button 'Submit'

    expect(current_path).to eq("/merchant/discounts/new")
    expect(page).to have_content("Failed to create new discount, try again!")
  end

  it "I see a link to create a new discount" do
    expect(page).to have_link('Create New Discount')
    click_link ('Create New Discount')
    expect(current_path).to eq("/merchant/discounts/new")
    fill_in :title, with: "New Discount"
    fill_in :percent_off, with: 50
    fill_in :information, with: "This is the best discount"
    fill_in :lowest_amount, with: 30
    fill_in :highest_amount, with: 39
    click_button 'Submit'

    expect(current_path).to eq("/merchant/discounts")
    expect(page).to have_content("New Discount")
    expect(page).to have_content("50")
  end
 end
end
