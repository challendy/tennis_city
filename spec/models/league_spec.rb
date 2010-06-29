require 'spec_helper'

describe League do
  it {should have_many(:teams) }  
  it {should have_many(:matches) }
  it {should have_one(:draft) }  
  it {should have_and_belong_to_many(:users) }  

  describe "when created" do
    before(:each) do
      @league = Factory(:league)
    end

    it "should create a new instance given valid attributes" do
      @league
    end
  end
  
  describe "when new team is confirmed" do
    before(:each) do
      @league = Factory(:league)
      @league.manager = @league.users.first.id
      @league.save
      @league.teams.each do |team|
        team.team_confirmed!
      end
    end
   it "should check to see if it was the last team to be confirmed" do
     @league.teams.last.check_league_status
     @league.status.should == "confirmed"
    end    
  end
end
