# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password, :password_confirmation
  
  before_filter :authenticate_user!
  
  def get_users
    users = User.find(:all).collect { |user| [user.email, user.id] }
  end
  
end
