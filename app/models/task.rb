class Task < ActiveRecord::Base
  attr_accessible :body, :priority, :user_id, :state
  belongs_to :user

<<<<<<< HEAD
  def finished?
  	state == "finished"
  end
=======
  validates_presence_of :user_id
>>>>>>> 0134818016e92dc26afa04035c1a2ff6bd36cd2e
end