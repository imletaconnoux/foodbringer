class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :is_chef?, :is_courier?, :is_customer?


  def home

  end


  # helper methods to check loggedin? and usertype?

  def logged_in?
  	!!session[:user_id]
  end

  def is_chef?
  	if session[:user_type] == "chef"
  		true
  	else
  		false
  	end
  end

  def is_courier?
  	if session[:user_type] == "courier"
  		true
  	else
  		false
  	end
  end

  def is_customer?
  	if session[:user_type] == "customer"
  		true
  	else
  		false
  	end
  end


end
