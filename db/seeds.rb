# ruby encoding: utf-8

# Users
admin = User.create(email: 'admin@internet.com', password: 'admin1strator',	firstname: 'Admin',	lastname: 'Adminson', admin: true)
users = []
5.times { |i| users << User.create(email: "user#{i}@internet.com", password: "supersecurepass", firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, admin: false) }

# Categories
rock = Category.create name: 'Rock'
rap = Category.create name: 'Rap'
metal = Category.create name: 'Metal'

rock_albums = ['How to Dismantle an Atomic Bomb', 'New Adventures in Hi-Fi', 'Led Zeppelin IV', 'Mr Beast', 'Ceremonies', 'Revolver', '90125', 'The Wall']
rap_albums = ['Straight Outta Compton', 'Get Rich Or Die Tryin\'', 'Ready To Die', 'The Chronic', 'The Eminem Show', 'All Eyez On Me', 'Life After Death', 'Na Rejonie']
metal_albums = ['The Black Album', 'Master of Puppets', 'Rust in Peace', 'God Hates Us All', 'Blackwater Park', 'Paranoid', 'Moving Pictures', 'Judgement']

8.times do |i|
  rock.products.create(title: rock_albums[i], description: Faker::Lorem.paragraph(4), price: rand(40) + 11, user: users[rand(5)])
  rap.products.create(title: rap_albums[i], description: Faker::Lorem.paragraph(4), price: rand(40) + 11, user: users[rand(5)])
  metal.products.create(title: metal_albums[i], description: Faker::Lorem.paragraph(4), price: rand(40) + 11, user: users[rand(5)])
end

Product.all.each do |product|
  3.times { product.reviews.create(content: Faker::Lorem.paragraph(rand(3)+1), rating: rand(5)+1, user: users[rand(5)+1]) }
end
