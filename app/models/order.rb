class Order < ApplicationRecord
	belongs_to :chef, class_name: "User"
	belongs_to :customer, class_name: "User"
	belongs_to :courier, class_name: "User", optional: true
	has_many :order_items
	has_many :items, through: :order_items
end
