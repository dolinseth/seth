class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_access_control_headers

  def require_authentication
  	unless current_user
  		redirect_to login_path
  	end
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Allow-Credentials'] = 'true'
  end

  def current_user
  	if cookies["user_id"].present?
  		@current_user = User.find(cookies["user_id"])
  	end
  end
helper_method :current_user
end