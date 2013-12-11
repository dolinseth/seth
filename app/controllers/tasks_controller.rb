class TasksController < ApplicationController
  protect_from_forgery

  before_filter :require_authentication, :only => [:index, :new, :create]

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
end