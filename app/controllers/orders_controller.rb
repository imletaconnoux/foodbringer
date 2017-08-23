class OrdersController < ApplicationController
	def show
		@order = Order.find_by(id: params[:id])
		@total_price = 5.00
	end

	def create
		@order = Order.create(order_params)

		redirect_to order_path(@order)

	end

	def index

		@completed_orders = current_user.completed_orders


	end

	def update
		order = Order.find_by(id: params[:id])
		if order.courier_id
			flash[:message] = "Too slow! This order has been accepted by another courier."
			redirect_to root_path
		else
			order.update(courier_id: current_user.id)
			redirect_to order_path(order)
		end
	end

	def delivered
		order = Order.find_by(id: params[:id])
		order.update(completed: true)
		redirect_to order_path(order)

	end


	private

	def order_params
		params.require(:order).permit(:customer_id, :chef_id, item_ids:[])
	end


end
