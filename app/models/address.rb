class Address < ApplicationRecord
	belongs_to :user

	# def to_s
	# 	label + "\n" + street_address + "\n" city + ", " + state + " " + zip
	# end

end
