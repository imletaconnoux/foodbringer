class SessionsController < ApplicationController

	# get "/login"
  def new

  end

  # post "/login"
  def create
  	@user = User.find_by(username: params[:user][:username])
  	if @user.authenticate(params[:user][:password])
  		session[:user_id] = @user.id
  		session[:user_type] = @user.type
  		redirect_to root_path
  	else
  		redirect_to login_path
  		# add flash message
  	end

  end

  # delete "/logout"
  def destroy
    session.clear
    redirect_to root_path
  end

end
