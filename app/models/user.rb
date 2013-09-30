class User < ActiveRecord::Base

  has_many :message
  validates_presence_of :username, :password
  
  # Authenticate a user. 
  #
  # Example:
  #   @user = User.authenticate('foo', 'bar')
  #
  def self.authenticate(login, pass)
    find_first(["username = ? AND password = ?", login, pass])
  end
  
  def self.authenticate?(login, pass)
    user = self.authenticate(login, pass)
    return false if user.nil?
    return true if user.login == login
    false
  end
  
end
