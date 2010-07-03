class DraftsController < ApplicationController
  layout "dashboard"

  def index
    @leagues = current_user.leagues_status("confirmed")
    @draft = @leagues.draft
  end

end