class DashboardController < ApplicationController
    
  def index
    initialize_dashboard
  end
  
  private  
    def initialize_dashboard
      #constants as constants or yml file
      statuses = %w(created confirmed active completed)
      statuses.each do |status|
        instance_variable_set("@#{status}_leagues", current_user.leagues_status(status))
        instance_variable_set("@#{status}_teams", current_user.teams_status(status))
      end
    end
end
