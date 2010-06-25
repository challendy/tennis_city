class Team < ActiveRecord::Base
  include AASM
  
  belongs_to :user
  belongs_to :league
  has_and_belongs_to_many :players
    
  validates_presence_of :user_id, :on => :create, :message => "can't be blank"
  
  attr_accessor :user_email
  
  aasm_column :status # defaults to aasm_state I am using status ##Think about changing it.

  aasm_initial_state :created

  aasm_state :created
  aasm_state :confirmed, :exit => :check_league_status
  aasm_state :complete

  aasm_event :team_confirmed do
     transitions :to => :confirmed, :from => [:created]
   end

   def check_league_status
     unless self.league.teams.detect{|x| x.stats == "created"}
   end
end
