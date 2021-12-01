# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
500.times do |i|
    User.create(username: "buyer#{i}", password: "pw#{i}", role: "buyer")
    User.create(username: "seller#{i}", password: "pw#{i}", role: "seller")
    Doughnut.create(name: "donut#{i}", price: 10.99, description: "description#{i}", quantity: 100000, image_url: "https://url#{i}")
end

order_items = []
500.times do |i|
    order_items.append({ doughnut_id: i+1, quantity: 1})
end
Order.create(user_id: 1, order_items_attributes: order_items)