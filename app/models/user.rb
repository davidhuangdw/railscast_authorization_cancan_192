class User < ActiveRecord::Base
  has_many :articles
  has_many :comments
  has_many :assignments
  has_many :roles, through: :assignments
end
