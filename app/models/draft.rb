class Draft < ActiveRecord::Base
  belongs_to :league
  has_many :draft_rounds
  
  after_create :initialize_draft
  
  include AASM

  aasm_column :status
  
  aasm_initial_state :created
  
  aasm_state :created
  aasm_state :in_progress, :enter => :email_teams_draft_started
  aasm_state :complete, :exit => :email_teams

  aasm_event :start_draft do
     transitions :to => :in_progress, :from => [:created]
   end
   
  def initialize_draft
    teams = self.league.teams.collect{|x| x.id}
    self.update_attributes(:number_of_teams => teams.length, :current_round => 0)
    draft_processor(teams)
    self.start_draft!
  end
  
  def draft_processor(teams) 
    temp_round = 0
    draft_order = teams.shuffle
    10.times do |r|
      r == 0 ? round = 0 : round = temp_round
      draft_order.each do |d|
        round += 1
        self.draft_rounds.create(:round => round, :team_id => d)
      end
      temp_round = round
    end
  end
  
  def email_teams_draft_started
    Notifier.deliver_league_draft_started(self.league)
  end
  
end
