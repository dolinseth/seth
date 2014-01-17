class TasksController < ApplicationController
  protect_from_forgery

  before_filter :require_authentication, :only => [:index, :new, :create, :clear]
  before_filter :index, :only => [:clear]

  def index
    @tasks = current_user.tasks
  end

  def clear
    @tasks.each do |task|
      User.find(@current_user).tasks.first.destroy
    end
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