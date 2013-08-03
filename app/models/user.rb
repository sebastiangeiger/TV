class User < ActiveRecord::Base
  attr_accessible :email, :password
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
