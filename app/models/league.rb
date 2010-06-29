class League < ActiveRecord::Base
  has_many :teams
  has_many :matches
  has_one :draft
  has_and_belongs_to_many :users
  
  accepts_nested_attributes_for :teams, :reject_if => proc { |attributes| attributes['user_id'].blank? }
    
  after_create :process_league_users 
  
  include AASM

  aasm_column :status
  
  aasm_initial_state :created
  
  aasm_state :created
  aasm_state :confirmed, :enter => :process_confirmed_league
  aasm_state :active, :enter => :email_teams
  aasm_state :complete, :enter => :email_teams

  aasm_event :teams_confirmed do
   transitions :to => :confirmed, :from => [:created]
  end

  aasm_event :draft_complete do
   transitions :to => :active, :from => [:confirmed]
  end

  aasm_event :league_ended do
    transitions :to => :complete, :from => [:active]
  end
   
  def process_confirmed_league
    Notifier.deliver_league_teams_confirmed(self)
    process_league_schedule
    start_draft_process
  end

  def manager_email
    User.find(self.manager).email
  end

  def users_email
    self.users.collect{|x| x.email}    
  end
      
  private
  def start_draft_process
    self.create_draft
  end

  def process_league_schedule
    teams = []
    teams = self.teams.collect{|x| x.id}
    Scheduler.run(teams, self.length.to_i, self.id)
  end

  def process_league_users
    users = []
    self.teams.each do |team|
      users << team.user        
    end
    self.users = users
    self.save
  end
end
