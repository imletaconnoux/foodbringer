# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "SEEDING THE DATABASE...."

# seeding account types
AccountType.find_or_create_by(name: "customer")
AccountType.find_or_create_by(name: "chef")
AccountType.find_or_create_by(name: "courier")

# seeding our chefs
User.create(first_name: "Maria", last_name: "Brunelli", username: "maria72", account_type_id: 2, password: "password", password_confirmation: "password")
User.create(first_name: "Philippe", last_name: "Petit", username: "philg", account_type_id: 2, password: "password123", password_confirmation: "password123")
User.create(first_name: "Jing", last_name: "Lin", username: "jlin", account_type_id: 2, password: "123", password_confirmation: "123")

# seeding some chefs' items
Item.find_or_create_by(name: "Pasta Primavera", chef_id: 1, description: "primavera", price: 12.5)
Item.find_or_create_by(name: "Bruschetta", chef_id: 1, description: "getoastet toast", price: 1.35)
Item.find_or_create_by(name: "Filet Mignon", chef_id: 2, description: "beefsteak", price: 22.9)
Item.find_or_create_by(name: "Salad Nicoise", chef_id: 2, description: "salad", price: 9.0)
Item.find_or_create_by(name: "French Onion Soup", chef_id: 2, description: "cheesy onion soup", price: 12.5)

Item.find_or_create_by(name: "Soup Dumplings", chef_id: 3, description: "dumplings with pork and soup", price: 8.5)
Item.find_or_create_by(name: "Lo Mein", chef_id: 3, description: "noodles with vegetables", price: 21.6)
Item.find_or_create_by(name: "Peking Duck", chef_id: 3, description: "slow cooked duck", price: 23.8)

# seeding chef addresses
Address.create(user_id: 1, label: "Work", street_address: "12 park avenue", city: "New York", state: "NY",zip: 11249)
Address.create(user_id: 2, label: "Work", street_address: "19 park avenue", city: "New York", state: "NY",zip: 11249)
Address.create(user_id: 3, label: "Work", street_address: "11 broadway", city: "New York", state: "NY",zip: 11249)

# seeding customer users
User.create(first_name: "Neil", last_name: "Steiner", username: "neil", account_type_id: 1, password: "password", password_confirmation: "password")

# seedin customer address
Address.create(user_id: 4, label: "home", street_address: "22 broadway", city: "New York", state: "NY", zip: 11249)

# seeding courier
User.create(first_name: "Isabelle", last_name: "Letaconnoux", username: "isabelle", account_type_id: 3, password: "password", password_confirmation: "password")

# seeding courier address
Address.create(user_id: 5, label: "home", street_address: "80 4th avenue", city: "New York", state: "NY", zip: 11249)

# seed orders
done = Order.create(customer_id: 4, courier_id: 5, chef_id: 3)
done.completed = true
done.save
Order.create(customer_id: 4,chef_id: 2)

# seed accompanying order_items
OrderItem.create(order_id: 1, item_id: 5, quantity: 3)
OrderItem.create(order_id: 1, item_id: 6, quantity: 1)
OrderItem.create(order_id: 2, item_id: 3, quantity: 19)
OrderItem.create(order_id: 2, item_id: 4, quantity: 12)
