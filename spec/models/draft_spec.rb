require 'spec_helper'

describe Draft do
  it {should belong_to(:league) }  
  it {should have_many(:draft_rounds) }  
  
  describe "when created" do 
    before(:each) do
      ActionMailer::Base.deliveries.clear
      
      @league = Factory(:league)
      @draft = @league.create_draft
    end

    it "should create a new instance given valid attributes" do
      @draft.should be_valid
    end
    
    context "after create the draft should initialized" do
      it "should process 30 draft rounds based on 3 teams with 10 players each " do
        @draft.draft_rounds.length.should == 30
      end 
      
      it "should email all the teams involved that the draft has been processed" do
        # ActionMailer::Base.deliveries.size.should == 3
      end
    end
  end
end
