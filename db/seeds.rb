# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
bike_shop = Merchant.create!(name: 'Matts Bikes',
                                address: '123 High St',
                                city: 'Denver',
                                state: 'CO',
                                zip: 80210,
                                enabled: true)
mike = bike_shop.users.create!(name: "Mike",
                                address: "124 Vine St",
                                city: "Denver",
                                state: "CO",
                                zip: "80206",
                                email: "mike@gmail.com",
                                password: "mike",
                                role: 2)

discount1 = bike_shop.discounts.create!(title: "Bulk Discount",
                                          percent_off: 5,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 5,
                                          highest_amount: 9)
discount2 = bike_shop.discounts.create!(title: "huge Discount",
                                          percent_off: 20,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 10,
                                          highest_amount: 19)
discount3 = bike_shop.discounts.create!(title: "Giant Discount",
                                          percent_off: 25,
                                          information: "Thanks for buying in bulk",
                                          lowest_amount: 20,
                                          highest_amount: 29)
