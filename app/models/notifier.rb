class Notifier < ActionMailer::Base
  
  def league_teams_confirmed(league)
    recipients   league.manager_email
    subject      "League Confirmed"
    from         "leagues@tenniscity.net"
    body         :league => league
    content_type "text/html"
  end
  
  def league_draft_started(league)
    recipients   league.users_email
    subject      "Tennis City Draft"
    from         "draft@tenniscity.net"
    body         :league => league
    content_type "text/html"
  end
end