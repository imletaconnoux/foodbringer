class Order < ApplicationRecord
	belongs_to :chef, class_name: "User"
	belongs_to :customer, class_name: "User"
	belongs_to :courier, class_name: "User", optional: true
	has_many :order_items
	has_many :items, through: :order_items

	def status
		if !self.courier_id
			"Your order has been accepted by chef #{self.chef.full_name}. It has not yet been accepted by a courrier."
		elsif self.courier_id && !self.completed
			"Your order has been accepted by chef #{self.chef.full_name}. #{self.courier.full_name} is on the way with your food!"
		elsif self.completed
			"Your order is completed. It arrived at #{self.updated_at}."
		end
	end

	# def delivered
	# 	self.completed = true
	# 	self.save
	# end


end
