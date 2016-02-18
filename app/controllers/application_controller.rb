class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #availible to all controllers but not the views

  #this allow the methods to be use in views
  helper_method :current_user, :logged_in?

  def current_user
  	#memorization
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end


end
