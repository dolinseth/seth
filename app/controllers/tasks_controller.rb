class TasksController < ApplicationController
  protect_from_forgery

  before_filter :require_authentication, :only => [:index, :new, :create]
  before_filter :current_user, :only => [:create]

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    task = params[:task]
    task = Task.new(:body => task[:body], :priority => task[:priority], :user_id => @current_user.id)
    task.save
    redirect_to tasks_url({:user_id=>@current_user.id})
  end
end