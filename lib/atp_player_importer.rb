require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pp'

class AtpPlayerImporter
  class << self
    def import
      doc = Nokogiri::HTML(open('http://www.atpworldtour.com/Rankings/Singles.aspx'))
    
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
        position_moved = a[5].gsub(" ", "")
        tournaments_played = a[6].gsub(" ", "")

        player_to_update = Player.find(:first, :conditions =>{:name => j_name})
        unless player_to_update.blank?
          player_to_update.update_attributes(:atp_rank => rank, :position_moved => position_moved, :tournaments_played => tournaments_played, :current_points => j_points)
        end
      end 
      process_players_points
      process_team_points
      process_league_standings
    end
    
    def process_players_points
      players = Player.find(:all)
      players.each do |p|
        old_points = p.points
        new_points = p.current_points
        change = new_points - old_points
        
        p.total_league_points = p.total_league_points + change
        p.points = new_points
        p.change = change
        p.save
      end
    end
    
    def process_team_points
      teams = Team.find(:all, :conditions => :status => "active")
      teams_weekly_points = 0
      teams.each do |t|
        t.players.each{|p| teams_weekly_points = teams_weekly_points + p.change}
        t.last_weeks_points = teams_weekly_points
        t.save 
      end
    end
  
    def process_league_standings
      
    end
  end
end
