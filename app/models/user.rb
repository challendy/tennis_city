class User < ActiveRecord::Base
  has_many :teams
  has_and_belongs_to_many :leagues
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :confirmable and :activatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  def leagues_status(status)
    leagues.collect{|x| x.status == "#{status}"}
  end
  
  def teams_status(status)
    teams.collect{|x| x.status == "#{status}"}    
  end
  
  def self.find_user_email(email)
    User.find(:first, :conditions => :email == email)
  end
  
end
