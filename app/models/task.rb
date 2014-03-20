class Task < ActiveRecord::Base
  attr_accessible :body, :priority, :user_id, :state
  belongs_to :user

  def finished?
  	state == "finished"
  end
end