class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence:true, uniqueness: true
  validates_presence_of :password, on: :create

  has_many :articles
  has_many :comments
  has_many :assignments
  has_many :roles, through: :assignments
end
