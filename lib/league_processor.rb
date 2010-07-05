require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pp'

class LeagueProcessor

  def initialize
    create_logs
  end

  def run
    import
    # process_team_points
    # process_league_standings
    print_log_footer
  end
  
  def import
    doc = Nokogiri::HTML(open(APP_CONFIG["atp_standings"]["url"]))
  
    players = doc.css('.bioTableAlt tr').inject([]) do |players, table|
      players << table.children.text        
    end
  
    players[1..(players.length-1)].each do |player|
      a = player.lines.to_a
      rank =  a[0].gsub(" ", "")
      name = a[2].gsub(" ", "")
      j_name = name.gsub(/\S{4}[)]/,"")
      points =  a[4].gsub(" ", "")
      j_points = points.gsub(",", "")
      tournaments_played = a[6].gsub(" ", "")

      player_to_update = Player.find(:first, :conditions =>{:name => j_name})
      unless player_to_update.blank?
        player_to_update.update_attributes(:atp_rank => rank, :tournaments_played => tournaments_played, :current_points => j_points)
        player_to_update.process_points
      else
        @log_file << "\nCould not find player with name: #{j_name}"
      end
    end 
  end

  def process_team_points
    @log_file << "\nStarted Processing Teams Points"
    teams = Team.all :conditions => {:status => "active"}
    teams_weekly_points = 0
    teams.each do |t|
      t.players.each{|p| teams_weekly_points = teams_weekly_points + p.change}
      t.last_weeks_points = teams_weekly_points
      t.save 
    end
  end

  def process_league_standings
    @log_file << "\nStarted Processing League Standings"
  end
  
  def create_logs
    @log_file = File.new("#{IMPORT_LOG_PATH}/#{Time.now.strftime("%Y_%m_%d")}.log", "w+")
    print_header    
  end
  
  def print_header
    @log_file << "\nStarted Import at: #{Time.now.strftime("%I:%M%p on %a %b %e, %Y")}\n----------------------------------------------------------------\n"
  end
  
  def print_log_footer
    @log_file << "\n----------------------------------------------------------------\nFinished Import at: #{Time.now.strftime("%I:%M%p on %a %b %e, %Y")}\n"
    @log_file.close
  end
end
