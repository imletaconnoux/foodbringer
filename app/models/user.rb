class User < ApplicationRecord
	has_many :orders, foreign_key: "customer_id"
	has_many :orders, foreign_key: "chef_id"	
	has_many :orders, foreign_key: "courier_id"
	has_many :addresses
	has_many :items, foreign_key: "chef_id"



end
