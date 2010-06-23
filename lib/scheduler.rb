class Scheduler
  class << self
    def run(teams, length)
      schedule = {}
      number_of_teams = teams.length
      number_of_matches = number_of_teams/2 * length
      teams_array = teams

      length.times do |i|
        if i == 0
          process_weeks_matches(teams_array, i+1)
        else
          process_teams_array(teams_array)        
          process_weeks_matches(teams_array, i+1)
        end
      end
    end
    
    def process_teams_array(teams)
      teams.reverse!
      tmp = teams.pop
      tmp2 = teams.pop
      teams.reverse!
      teams.push(tmp2)
      teams.insert(0, tmp)       
    end
    
    def process_weeks_matches(weeks_teams, w)
      a_teams = weeks_teams[0..(weeks_teams.length/2 - 1)]
      b_teams = weeks_teams - a_teams
      
      a_teams.length.times do |i|
        match = Match.create(:week => w, :team_1 => a_teams[i], :team_2 => b_teams[i])
      end
    end
    
  end
end