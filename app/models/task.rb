class Task < ActiveRecord::Base
  attr_accessible :body, :priority, :user_id
  belongs_to :user

  validates_presence_of :user_id
end