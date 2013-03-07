class TasksController < ApplicationController
  protect_from_forgery

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    task = params[:task]
    task = Task.new(:body => task[:body], :priority => task[:priority])
    task.save

    redirect_to tasks_path
  end

  def current_user
    @user = User.find(params[:user_id])
  end
end