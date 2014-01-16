class UsersController < ApplicationController
  protect_from_forgery

  def login
    @user = User.new
  end

  def create
    @user = User.create(params["user"])
    cookies["user_id"] = @user.id
    redirect_to tasks_path
  end

  def new
    @user = User.new
  end

  def authenticate
    @user = User.find_by_email(params["user"]["email"])
    if @user.password == params["user"]["password"]
      cookies["user_id"] = @user.id
      redirect_to tasks_url({:user_id=>@user.id})
    else
      raise "You shall not pass"
    end
  end
end