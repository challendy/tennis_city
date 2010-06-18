class League < ActiveRecord::Base
  has_many :teams
  has_many :matches
  has_and_belongs_to_many :users
  
  accepts_nested_attributes_for :teams
  
  include AASM

  aasm_column :status # defaults to aasm_state I am using status ##Think about changing it.
  
  aasm_initial_state :created
  
  aasm_state :created
  aasm_state :confirmed, :enter => :email_manager
  aasm_state :active, :enter => :email_teams
  aasm_state :complete, :enter => :email_teams

#  @leauge.teams_confirmed!
  aasm_event :teams_confirmed do
     transitions :to => :confirmed, :from => [:created]
   end
  
   aasm_event :draft_complete do
     transitions :to => :active, :from => [:confirmed]
   end
   
   aasm_event :league_ended do
      transitions :to => :complete, :from => [:active]
   end
   
   def email_manager
     
     # Called when record moves into the "confirmed" state.
   end

   def email_teams
     # Called when record moves into the "active" state.
   end
   
   def method3
     # Called when record moves into the "complete" state.
   end
   
   class << self
     def build_new_league_teams
       raise
      self.users.each do |user|
        Teams.create(:user => user)
      end
     end
   end
   
   
   
end
