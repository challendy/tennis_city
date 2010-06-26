class Notifier < ActionMailer::Base
  
  def league_teams_confirmed(league)
    recipients   league.manager_email
    subject      "League Confirmed"
    from         "league_processor@tenniscity.net"
    body         :league => league
    content_type "text/html"
  end
end