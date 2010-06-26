namespace :db do
  desc "Initial db load of atp players"
  task :initial_player_import  => :environment do
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
      country = name[/\S{4}[)]/]
      country.gsub!("(", "").gsub!(")", "")
      points =  a[4].gsub(" ", "")
      j_points = points.gsub(",", "")
      position_moved = a[5].gsub(" ", "")
      tournaments_played = a[6].gsub(" ", "")

      Player.create(:atp_rank => rank, :name => j_name, :points => j_points, :tournaments_played => tournaments_played, :country => country)
    end 
  end
end