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

	def name
		full_name
	end

	# returns incomplete orders that belong to current instance of customer user
	def outstanding_meals
		self.meals.select do |meal|
			meal.completed == false
		end
	end

	# for chefs to accept
	def outstanding_orders
		self.orders.select do |order|
			order.accepted == false
		end
	end

	def orders_in_progress
		self.orders.select do |order|
			order.accepted == true && order.picked_up == false
		end
	end

	#orders needing a courier
	def available_orders
		if self.account_type_id.to_i == 3
			Order.all.where(courier_id: nil).select do |order|
				order.chef.addresses.first.zip == self.addresses.first.zip
			end
		end
	end

	#allow courier to view accepted but not yet completed deliveries
	def accepted_deliveries
		self.deliveries.where(completed: false)
	end

	# for past orders for each type of user
	def completed_orders
		if self.account_type_id.to_i == 1
			self.meals.where(completed: true)
		elsif self.account_type_id.to_i == 2
			self.orders.where(completed: true)
		elsif self.account_type_id.to_i == 3
			self.deliveries.where(completed: true)
		end
	end


# go back and fix multiple zip issue

	def available_chefs
		self.class.all.select do |user|
			user.account_type_id.to_i == 2 && user.addresses.first.zip == self.addresses.first.zip
		end
	end










end
