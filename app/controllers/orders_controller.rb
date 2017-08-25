class OrdersController < ApplicationController
	def show
		@order = current_order
		@total_price = 5.00
	end

	def create
		binding.pry
		@order = Order.create(order_params)

		redirect_to order_path(@order)

	end

	def index
		@completed_orders = current_user.completed_orders
	end

	def update
		if current_order.courier_id
			flash[:message] = "Too slow! This order has been accepted by another courier."
			redirect_to root_path
		else
			current_order.update(courier_id: current_user.id)
			redirect_to order_path(current_order)
		end
	end


	#--------------STATUS MODIFYING ACTIONS------------------------------

	# chef accepts order and begins working on it
	def accepted
		current_order.update(accepted: true)
		redirect_to order_path(current_order)
	end

	# chef has completed order and sets ready => true
	def ready
		current_order.update(ready: true)
		redirect_to order_path(current_order)
	end

	# courier has picked up order
	def picked_up
		current_order.update(picked_up: true)
		redirect_to order_path(current_order)
	end

	# courier has delivered order. it is now complete.
	def delivered
		current_order.update(completed: true)
		redirect_to order_path(current_order)
	end

	#--------------------------------------------------------------------

	private

	def current_order
		Order.find_by(id: params[:id])
	end

	def order_params
		params.require(:order).permit(:customer_id, :chef_id, item_ids:[])
	end


end
