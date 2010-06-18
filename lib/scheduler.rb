require 'pp'
class Scheduler
  class << self
    
    def run(teams, length)
      schedule = {}
      number_of_teams = teams.length
      number_of_matches = number_of_teams/2 * length
      weeks_teams = teams

      length.times do |i|
        if i == 0
          process_weeks_matches(weeks_teams, i+1)
        else
          weeks_teams.reverse!
          tmp = weeks_teams.pop
          tmp2 = weeks_teams.pop
          weeks_teams.reverse!
          weeks_teams.push(tmp2)
          weeks_teams.insert(0, tmp)            
        
          process_weeks_matches(weeks_teams, i+1)
        end
      end
    end
    
    def process_weeks_matches(weeks_teams, w)
      a_teams = weeks_teams[0..(weeks_teams.length/2 - 1)]
      b_teams = weeks_teams - a_teams
      
      a_teams.length.times do |i|
        match = Match.new(:week => w, :team_1 => a_teams[i], :team_2 => b_teams[i])
        puts match.inspect
      end
    end
  end
end