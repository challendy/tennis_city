class DashboardController < ApplicationController
  layout 'dashboard'
  
  before_filter :initialize_dashboard  
  
  def index
    
  end
  
  private  
    def initialize_dashboard
      statuses = %w(created confirmed active completed)
      statuses.each do |status|
        instance_variable_set("@#{status}_leagues", current_user.leagues_status(status))
        instance_variable_set("@#{status}_teams", current_user.teams_status(status))
      end
    end
end
