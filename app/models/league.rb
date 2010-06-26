class League < ActiveRecord::Base
  has_many :teams
  has_many :matches
  has_and_belongs_to_many :users
  
  accepts_nested_attributes_for :teams, :reject_if => proc { |attributes| attributes['user_id'].blank? }
    
  after_create :process_league_users 
  
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
     Notifier.deliver_league_teams_confirmed(self)
      
     # Called when record moves into the "confirmed" state.
   end

   def manager_email
     User.find(self.manager).email
   end

   
   private
   
    def process_league_users
      users = []
      self.teams.each do |team|
        users << team.user        
      end
      self.users = users
      self.save
    end
end
