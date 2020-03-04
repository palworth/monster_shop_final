#Merchant Shops
megan = Merchant.create!(name: 'Megans Marmalades',
                         address: '123 Main St',
                         city: 'Denver',
                         state: 'CO',
                         zip: 80218)
brian = Merchant.create!(name: 'Brians Bagels',
                         address: '125 Main St',
                         city: 'Denver',
                         state: 'CO',
                         zip: 80218)

bike_shop = Merchant.create!(name: 'Matts Bikes',
                            address: '123 High St',
                            city: 'Denver',
                            state: 'CO',
                            zip: 80210,
                            enabled: true)
#Items
bike_shop.items.create!(name: 'Dropper Post', description: "Fox!", price: 200, image: 'https://reviews.mtbr.com/wp-content/uploads/2018/10/DIVINE-in-bike.jpg', active: true, inventory: 140 )
bike_shop.items.create!(name: 'Full Face Helment', description: "Safe!", price: 150, image: 'https://photos.trendnation.com/products/640000/tn-1209358_1.jpg', active: true, inventory: 320 )
bike_shop.items.create!(name: 'Tire wrench', description: "Easy!", price: 10, image: 'https://i.ebayimg.com/images/i/391288762968-0-1/s-l1000.jpg', active: true, inventory: 31 )
bike_shop.items.create!(name: 'Front axle', description: "sturdy!", price: 150, image: 'https://i.ebayimg.com/images/i/271316523336-0-1/s-l1000.jpg', active: true, inventory: 50 )
bike_shop.items.create!(name: 'Shock', description: "Huge!", price: 850, image: 'https://www.jensonusa.com/globalassets/product-images---all-assets/fox-racing-shox/rs199b048.75-2.5--remo.jpg', active: true, inventory: 3 )

megan.items.create!(name: 'Orange Marmalade', description: "Super good", price: 20, image: 'https://recipesmadeeasy.co.uk/wp-content/uploads/2017/01/marmalade-2-Edit.jpg', active: true, inventory: 50 )
megan.items.create!(name: 'Grapefruit Marmalade', description: "the rarest marmalade!", price: 30, image: 'https://www.m-s.gr/wp-content/uploads/2015/03/D3S_7886-copy-462x601.jpg', active: true, inventory: 12)
brian.items.create!(name: 'Plain Bagel', description: "True Classic", price: 2, image: 'https://cdn-images-1.medium.com/max/1600/0*E78sVvqL5Dfgrm5m.', active: true, inventory: 34 )

#Merchant Users
bike_shop.users.create!(name: "Mike",
                        address: "124 Vine St",
                        city: "Denver",
                        state: "CO",
                        zip: "80206",
                        email: "mike@gmail.com",
                        password: "mike",
                        role: 2)

megan.users.create!(name: "Carter",
                        address: "124 Vine St",
                        city: "Denver",
                        state: "CO",
                        zip: "80206",
                        email: "Carter@gmail.com",
                        password: "Carter",
                        role: 2)

#Regular user
 User.create!(name: "Tim",
              address: "154 Humboldt St",
              city: "Denver",
              state: "CO",
              zip: "80206",
              email: "tim@gmail.com",
              password: "tim",
              role: 1)

#Discounts
megan.discounts.create!(title: "Discount",
                                          percent_off: 5,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 4,
                                          highest_amount: 10)
megan.discounts.create!(title: "Another One",
                                          percent_off: 5,
                                          information: "Good choice",
                                          lowest_amount: 9,
                                          highest_amount: 16)
bike_shop.discounts.create!(title: "Bulk Discount",
                                          percent_off: 5,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 4,
                                          highest_amount: 10)
bike_shop.discounts.create!(title: "Conflict Discount",
                                          percent_off: 90,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 9,
                                          highest_amount: 12)
bike_shop.discounts.create!(title: "huge Discount",
                                          percent_off: 20,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 9,
                                          highest_amount: 20)
bike_shop.discounts.create!(title: "Giant Discount",
                                          percent_off: 25,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 19,
                                          highest_amount: 30)
