class User < ActiveRecord::Base
  attr_accessible :email, :password, :name
  has_many :tasks
  validates_uniqueness_of :email
end