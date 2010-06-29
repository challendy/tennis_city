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

  def check_league_status
   if self.league.teams.detect{|x| x.status == "created"}.blank?
     self.league.teams_confirmed!     
   end
  end
end
