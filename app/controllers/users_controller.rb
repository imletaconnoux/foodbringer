class UsersController < ApplicationController

  def new
    @user = User.new
    @user.addresses.build

  end

  def create

  	@user = User.create(user_params)


  	if @user.valid?
  		# successful creation of a user logs that user in and sets session user_type accordingly
  		session[:user_id] = @user.id
  		session[:user_type] = @user.account_type.name
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  def edit
 		@user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
  	if @user.update(user_params)
  		redirect_to root_path
  	else
  		render :edit
  	end
  end

  def show
  	@user = User.find_by(id: params[:id])
    @order = Order.new

    # authorizing views
    # if session[:user_id] == params[:id] || @user.account_type_id == 2
    # end
  end

  # def index

  # end

  def destroy
  	User.find_by(id: session[:user_id]).destroy
  	redirect_to root_path
  end


  private

  	# think about using a before action to set user and their permissions based on session id?

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :account_type_id, :username, :password, :password_confirmation,
    addresses_attributes: [:label, :street_address, :city, :state, :zip, :user_id])
  end

end
