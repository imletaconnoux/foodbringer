class OrdersController < ApplicationController
	def show
		@order = Order.find_by(id: params[:id])
		@total_price = 5.00
	end

	def create
		@order = Order.create(order_params)

		redirect_to order_path(@order)

	end



	private

	def order_params
		params.require(:order).permit(:customer_id, :chef_id, item_ids:[])
	end


end
