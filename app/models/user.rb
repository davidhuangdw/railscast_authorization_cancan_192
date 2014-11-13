class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence:true, uniqueness: true
  validates_presence_of :password, on: :create

  ROLES = %w{admin moderate author}
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map{|r| 2**ROLES.index(r)}.sum
  end
  def roles
    ROLES.reject{ |r| ((roles_mask||0) & 2**ROLES.index(r)).zero? }
  end
  def role?(role)
    roles.include? role.to_s
  end

  has_many :articles
  has_many :comments
  has_many :assignments
  has_many :roles, through: :assignments

end
