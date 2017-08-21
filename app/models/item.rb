class Item < ApplicationRecord
	belongs_to :chef, class_name: "User", foreign_key: "chef_id"
	has_many :order_items
	has_many :orders, through: :order_items
	
end
