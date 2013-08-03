class User < ActiveRecord::Base
  attr_accessible :email, :password
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def self.for_email(email)
    User.where(email: email).first || NonExistingUser.new
  end
end

class NonExistingUser
  def authenticate(password)
    false
  end
end
