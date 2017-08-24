class Address < ApplicationRecord
	belongs_to :user
	validates :label, :street_address, :city, :state, :zip, presence: true

	def to_s
		label + "\n " + street_address + "\n " + city + ", " + state + " " + zip.to_s
	end

	def findable
		street_address + " " + city + ", " + state + " " + zip.to_s
	end

end
