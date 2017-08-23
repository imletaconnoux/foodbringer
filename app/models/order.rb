class Order < ApplicationRecord
	belongs_to :chef, class_name: "User"
	belongs_to :customer, class_name: "User"
	belongs_to :courier, class_name: "User", optional: true
	has_many :order_items
	has_many :items, through: :order_items

	def status
		# needs improvement

		if !self.accepted
			"Order has not yet been accept by chef."
		elsif self.accepted && !self.ready
			"Order is being prepared."
		elsif self.ready && !self.picked_up
			"Order is ready to be picked up."
		elsif self.picked_up && !self.completed
			"Order is on it's way to customer."
		elsif self.completed
			"Order has been delivered. Nom nom nom..."
		end
	end







end
