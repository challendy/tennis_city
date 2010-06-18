class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :league
  has_and_belongs_to_many :players
  
  accepts_nested_attributes_for :user
  
  include AASM

  aasm_column :status # defaults to aasm_state I am using status ##Think about changing it.

  aasm_initial_state :created

  aasm_state :created# , :enter => :email_users
  aasm_state :confirmed
  aasm_state :complete

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

   def email_users
     raise
     # Called when record moves into the "confirmed" state.
   end

   def method2
     # Called when record moves into the "active" state.
   end

   def method3
     # Called when record moves into the "complete" state.
   end  
end
