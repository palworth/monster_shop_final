# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   mov Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
bike_shop = Merchant.create!(name: 'Matts Bikes',
                            address: '123 High St',
                            city: 'Denver',
                            state: 'CO',
                            zip: 80210,
                            enabled: true)
bike_shop.items.create!(name: 'Dropper Post', description: "Fox!", price: 200, image: 'https://reviews.mtbr.com/wp-content/uploads/2018/10/DIVINE-in-bike.jpg', active: true, inventory: 140 )
bike_shop.items.create!(name: 'Full Face Helment', description: "Safe!", price: 150, image: 'https://photos.trendnation.com/products/640000/tn-1209358_1.jpg', active: true, inventory: 320 )
bike_shop.items.create!(name: 'Tire wrench', description: "Easy!", price: 10, image: 'https://i.ebayimg.com/images/i/391288762968-0-1/s-l1000.jpg', active: true, inventory: 31 )
bike_shop.items.create!(name: 'Front axle', description: "sturdy!", price: 150, image: 'https://i.ebayimg.com/images/i/271316523336-0-1/s-l1000.jpg', active: true, inventory: 50 )
bike_shop.items.create!(name: 'Shock', description: "Huge!", price: 850, image: 'https://www.jensonusa.com/globalassets/product-images---all-assets/fox-racing-shox/rs199b048.75-2.5--remo.jpg', active: true, inventory: 3 )

megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
bike_shop.users.create!(name: "Mike",
                                address: "124 Vine St",
                                city: "Denver",
                                state: "CO",
                                zip: "80206",
                                email: "mike@gmail.com",
                                password: "mike",
                                role: 2)
 User.create!(name: "Tim",
                  address: "154 Humboldt St",
                  city: "Denver",
                  state: "CO",
                  zip: "80206",
                  email: "tim@gmail.com",
                  password: "tim",
                                                               role: 1)

megan.discounts.create!(title: "Bulk Discount",
                                          percent_off: 5,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 4,
                                          highest_amount: 10)
bike_shop.discounts.create!(title: "Bulk Discount",
                                          percent_off: 5,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 4,
                                          highest_amount: 10)
bike_shop.discounts.create!(title: "Bulk Discount",
                                          percent_off: 5,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 4,
                                          highest_amount: 10)
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
