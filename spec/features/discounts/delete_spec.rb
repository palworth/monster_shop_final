require 'rails_helper'
RSpec.describe "As a merchant employee", type: :feature do
  describe 'when I visit my merchant dashboard' do
    before(:each) do
      Discount.destroy_all
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
      click_link "Merchant Dashboard"
      expect(current_path).to eq("/merchant")
      click_link 'Store Discount Index'
      expect(current_path).to eq("/merchant/discounts")
    end
    it "I see a delete button for discounts when I vist thier show page" do
      click_link "#{@discount1.title}"
      expect(current_path).to eq("/merchant/discounts/#{@discount1.id}")
      expect(page).to have_button("Delete Discount")

      click_button 'Delete Discount'
      expect(current_path).to eq("/merchant/discounts")
      expect(page).to_not have_content(@discount1.title)
      expect(page).to_not have_content(@discount1.discount_range)

    end
  end
end
