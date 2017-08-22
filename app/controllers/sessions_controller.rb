require 'pry'

class SessionsController < ApplicationController

	# get "/login"
  def new

  end

  # post "/login"
  def create

  	if @user = User.find_by(username: params[:username])
  	   if @user.authenticate(params[:password])
  		    session[:user_id] = @user.id
  		    session[:user_type] = @user.account_type.name
  		    redirect_to root_path
  	    end
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
