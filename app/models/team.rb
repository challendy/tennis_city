class Team < ActiveRecord::Base
  include AASM
  
  belongs_to :user
  belongs_to :league
  has_and_belongs_to_many :players
    
  before_create :process_user_email
  validates_presence_of :user_id, :on => :create, :message => "can't be blank"
  
  attr_accessor :user_email
  
  aasm_column :status # defaults to aasm_state I am using status ##Think about changing it.

  aasm_initial_state :created

  aasm_state :created
  aasm_state :confirmed
  aasm_state :complete

#  @leauge.teams_confirmed!
  aasm_event :team_confirmed do
     transitions :to => :confirmed, :from => [:created]
   end

   def email_users
     # Called when record moves into the "confirmed" state.
   end

   def process_user_email
     raise self.user_email.inspect
     self.user_id = User.find_user_email(self.user_email).id
     self.save
   end  
end
