class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :is_chef?, :is_courier?, :is_customer?, :current_user


  def home

  end


  # helper methods to check loggedin? and usertype?

  def logged_in?

    @user = User.find_by(id: session[:user_id])
    !!session[:user_id]
  end

  def is_chef?
  	if session[:user_type] == "chef"
      @user = User.find_by(id: session[:user_id])
  		true
  	else
  		false
  	end
  end

  def is_courier?
  	if session[:user_type] == "courier"
      @user = User.find_by(id: session[:user_id])
  		true
  	else
  		false
  	end
  end

  def is_customer?
  	if session[:user_type] == "customer"
      @user = User.find_by(id: session[:user_id])
  		true
  	else
  		false
  	end
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


end
