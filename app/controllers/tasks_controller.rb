class TasksController < ApplicationController
  protect_from_forgery

  def index
    if params[:user_id].present?
      @tasks = current_user.tasks
    else
      @tasks = Task.all
    end
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
    @user = User.find_by_id(params[:user_id])
  end
end