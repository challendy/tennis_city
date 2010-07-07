class DraftsController < ApplicationController

  def index
    @leagues = current_user.leagues_status("confirmed")
    @draft = @leagues.draft
  end

end