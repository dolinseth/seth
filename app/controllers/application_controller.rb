class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_authentication
  	unless current_user
  		redirect_to login_path
  	end
  end

  def current_user
  	if cookies["user_id"].present?
  		@current_user = User.find(cookies["user_id"])
  	end
  end
helper_method :current_user
end
