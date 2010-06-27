require 'spec_helper'

describe DraftProcessor do
  before(:each) do
    @draft = Factory(:draft)
  end

  it "should create 40 draft rounds for the league" do
    @draft.draft_rounds.length.should == 40
  end
end
