class Session < ActiveRecord::Base
  attr_accessible :expires_at, :user

  belongs_to :user

  def self.for_token(token)
    where(token: token).first || NonExistingSession.new
  end

  def does_not_exist?
    not exists?
  end

  def exists?
    true
  end
end

class NonExistingSession
  def does_not_exist?
    not exists?
  end

  def exists?
    false
  end
end
