class ItemsController < ApplicationController

	def new
		@item = Item.new
	end

	def create
		# will need validation check here
		@item = Item.create(item_params)
		redirect_to items_path
	end

	def index
		@items = current_user.items
	end

	def edit
		# will need validation check here
		@item = Item.find(params[:id])
	end

	def update
		# binding.pry
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to items_path
	end

	def destroy
		Item.find(params[:id]).destroy
		redirect_to items_path
	end


	private

	def item_params
		params.require(:item).permit(:name, :description, :price, :chef_id)
	end


end
