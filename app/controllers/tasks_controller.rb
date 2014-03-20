class TasksController < ApplicationController
  protect_from_forgery

  before_filter :require_authentication, :only => [:index, :new, :create, :clear]

  def index
    @tasks = current_user.tasks.sort { |a,b| b.priority <=> a.priority }
    respond_to do |format|
      format.html
      format.json do
        render :json => {:tasks => @tasks}
      end
    end
  end

  def clear
    current_user.tasks.destroy_all
    redirect_to tasks_url
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_url
  end

  def update
    Task.find(params[:id]).update_attributes(:state => "finished")
    redirect_to tasks_url
  end

  def new
    @task = Task.new
  end

  def create
    respond_to do |format|
      format.html do
        task = params[:task]
        task = Task.new(:body => task[:body], :priority => task[:priority], :user_id => @current_user.id)
        task.save
        redirect_to tasks_url
      end
      format.json do
        task = Task.new(:body => params[:body], :priority => params[:priority], :user_id => @current_user.id)
        task.save
        render :json => {:success => true}
      end
    end
  end
end


# $.ajax({
#   type: "POST",
#   url: "http://localhost:3000/tasks.json",
#   data: {"body": "Make Breakfast", "priority": "26"},
#   success: function(){},
#   dataType: "json",
#   crossDomain: true
# });