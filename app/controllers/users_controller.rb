class UsersController < ApplicationController
  protect_from_forgery

  def new
  	@user = User.new
  end

  def create
  	@user = User.find_by_email(params["user"]["email"])
  	if @user.password == params["user"]["password"]
  		cookies["user_id"] = @user.id
  		redirect_to tasks_url({:user_id=>@user.id})
  	else
  		raise "You shall not pass"
  	end
  end
end
