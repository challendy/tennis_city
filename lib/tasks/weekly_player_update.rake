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
     
      player_to_update = Player.find(:first, :conditions =>{:name => plyr.j_name})
        unless player_to_update.blank?
          player_to_update.atp_rank = plyr.rank
          player_to_update.tournaments_played = plyr.tournaments_played
          player_to_update.current_points = plyr.j_points
          player_to_update.save
        end
    end
  end
end
