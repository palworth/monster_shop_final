require 'rails_helper'
RSpec.describe "As a regular user", type: :feature do
  describe 'when I add an item to my cart and visit my cart' do
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

     @tim = User.create!(name: "Tim",
                                      address: "154 Humboldt St",
                                      city: "Denver",
                                      state: "CO",
                                      zip: "80206",
                                      email: "tim@gmail.com",
                                      password: "tim",
                                      role: 1)


    @item1 = @bike_shop.items.create!(name: 'Dropper Post', description: "Fox!", price: 200, image: 'https://reviews.mtbr.com/wp-content/uploads/2018/10/DIVINE-in-bike.jpg', active: true, inventory: 140 )
    @item2 = @bike_shop.items.create!(name: 'Full Face Helment', description: "Safe!", price: 150, image: 'https://photos.trendnation.com/products/640000/tn-1209358_1.jpg', active: true, inventory: 320 )
    @item3 = @bike_shop.items.create!(name: 'Tire wrench', description: "Easy!", price: 10, image: 'https://i.ebayimg.com/images/i/391288762968-0-1/s-l1000.jpg', active: true, inventory: 31 )
    @item4 = @bike_shop.items.create!(name: 'Front axle', description: "sturdy!", price: 150, image: 'https://i.ebayimg.com/images/i/271316523336-0-1/s-l1000.jpg', active: true, inventory: 50 )
    @item5 = @bike_shop.items.create!(name: 'Shock', description: "Huge!", price: 850, image: 'https://www.jensonusa.com/globalassets/product-images---all-assets/fox-racing-shox/rs199b048.75-2.5--remo.jpg', active: true, inventory: 3 )

       @discount1 = @bike_shop.discounts.create!(title: "Bulk Discount",
                                                percent_off: 25,
                                                information: "Thanks for buying in bulk",
                                                lowest_amount: 4,
                                                highest_amount: 10)
      @discount2 = @bike_shop.discounts.create!(title: "huge Discount",
                                                percent_off: 20,
                                                information: "Thanks for buying in bulk",
                                                lowest_amount: 9,
                                                highest_amount: 20)
      @discount3 = @bike_shop.discounts.create!(title: "Giant Discount",
                                                percent_off: 25,
                                                information: "Thanks for buying in bulk",
                                                lowest_amount: 19,
                                                highest_amount: 30)
      visit "/login"
      fill_in :email, with: @tim.email
      fill_in :password, with: @tim.password
      click_button "Log In"
      click_link "Items"
      visit item_path(@item1)
      click_button 'Add to Cart'
      visit '/cart'
    end

    it "I add less than 5 items and don't see discount applied text" do
      expect(current_path).to eq("/cart")
      expect(page).to have_content(@item1.name)
        within"#item-#{@item1.id}" do
          click_button 'More of This!'
          click_button 'More of This!'
        end
      expect(page).to_not have_content("Discount Applied:")
    end

   it "I add less than 5 items and don't see discount applied text" do
      expect(current_path).to eq("/cart")
      expect(page).to have_content(@item1.name)
      within"#item-#{@item1.id}" do
        click_button 'More of This!'
        click_button 'More of This!'
      end
      visit item_path(@item2)
      click_button 'Add to Cart'
      visit '/cart'
      within"#item-#{@item2.id}" do
        click_button 'More of This!'
        click_button 'More of This!'
      end
    expect(page).to_not have_content("Discount Applied:")
   end

  it "I add 5 items and recieve the fist discount, bulk discount" do
      expect(current_path).to eq("/cart")
      expect(page).to have_content(@item1.name)
        within"#item-#{@item1.id}" do
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
        end
    expect(page).to have_content("Discount Applied: New Total = $750.00")
    end

    it "I add 10 items and recieve the fist discount, bulk discount" do
      expect(current_path).to eq("/cart")
      expect(page).to have_content(@item1.name)
        within"#item-#{@item1.id}" do
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
        end
    expect(page).to have_content("Discount Applied: New Total = $1,600.00")
    end

    it "I add 20 items and recieve the fist discount, bulk discount" do
       expect(current_path).to eq("/cart")
       expect(page).to have_content(@item1.name)
        within"#item-#{@item1.id}" do
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
          click_button 'More of This!'
        end
        expect(page).to have_content("Discount Applied: New Total = $3,040.00")
    end
   end
  end
