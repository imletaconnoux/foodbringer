class OrdersController < ApplicationController
	def show
		@order = Order.find_by(id: params[:id])
		@total_price = 5.00
	end
end
