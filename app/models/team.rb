class Team < ActiveRecord::Base
  include AASM
  
  belongs_to :user
  belongs_to :league
  has_and_belongs_to_many :players
    
  validates_presence_of :user_id, :on => :create, :message => "can't be blank"
    
  aasm_column :status

  aasm_initial_state :created

  aasm_state :created
  aasm_state :confirmed
  aasm_state :active
  aasm_state :complete

  aasm_event :team_confirmed do
     transitions :to => :confirmed, :from => [:created]
   end

  def record
    "#{wins}-#{losses}-#{ties}"
  end
  
  def winning_percentage
    total_games = self.wins + self.losses + self.ties
    return self.wins / total_games
  end
  
  def games_back
    league_leader_wins = self.league.current_leader.wins
    league_leader_wins - self.wins
  end
end
