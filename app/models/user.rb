class User < ActiveRecord::Base
  attr_accessible :email, :password
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def self.for_email(email)
    User.where(email: email).first || EmptyUser.new
  end
end

class EmptyUser
  def authenticate(password)
    false
  end
end
