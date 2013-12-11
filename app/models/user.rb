class User < ActiveRecord::Base
  attr_accessible :email, :password, :name
  has_many :tasks
end