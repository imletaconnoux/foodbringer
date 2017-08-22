class User < ApplicationRecord

	has_many :orders, foreign_key: "chef_id" #, class_name: "Order"
	has_many :meals, foreign_key: "customer_id", class_name: "Order"
	has_many :deliveries, foreign_key: "courier_id", class_name: "Order"


	has_many :addresses
	has_many :items, foreign_key: "chef_id"
	belongs_to :account_type
	has_secure_password

	def full_name
		self.first_name + " " + self.last_name
	end

	# returns incomplete orders that belong to current instance of customer user
	def outstanding_meals
		self.meals.select do |meal|
			meal.completed == false
		end
	end

# go back and fix multiple zip issue

	def available_chefs

		self.class.all.select do |user|
			user.account_type_id.to_i == 2 && user.addresses.first.zip == self.addresses.first.zip
		end
	end


	# returns orders that need courier

end
