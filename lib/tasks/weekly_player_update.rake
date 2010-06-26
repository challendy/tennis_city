namespace :db do
  desc "Initial db load of atp players"
  task :weekly_player_update  => :environment do
    require 'nokogiri'
    require 'open-uri'

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
     
      puts "#{j_name}"
      player_to_update = Player.find(:first, :conditions =>{:name => j_name})
      puts player_to_update.name
      unless player_to_update.blank?
        player_to_update.update_attributes(:atp_rank => rank, :tournaments_played => tournaments_played, :current_points => j_points)
      end
    end
    
    
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
end
