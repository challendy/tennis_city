require 'spec_helper'

describe Draft do
  it {should belong_to(:league) }  
  it {should have_many(:draft_rounds) }  
  
  describe "when created" do 
    before(:each) do
      @league = Factory(:league)
      @draft = @league.draft.create
    end

    it "should create a new instance given valid attributes" do
      @draft
    end
  end
end
