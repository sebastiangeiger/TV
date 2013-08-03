class User < ActiveRecord::Base
  attr_accessible :email, :password
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def self.for_email(email)
    User.where(email: email).first || NonExistingUser.new
  end

  def self.for_credentials(hash = {})
    for_email(hash[:email]).authenticate(hash[:password]) ||
      NonExistingUser.new
  end

  def authenticated?
    persisted?
  end
end

class NonExistingUser
  def authenticate(password)
    false
  end
  def authenticated?
    false
  end
end
