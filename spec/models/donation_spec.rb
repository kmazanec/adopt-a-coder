require 'spec_helper'

  describe Donation do

    describe "Validations and Associations" do

      it "should belong to a donor" do
        donation = Donation.reflect_on_association(:donor)
        donation.macro.should == :belongs_to
      end

      it "should belong to a campaign" do
        donation = Donation.reflect_on_association(:campaign)
        donation.macro.should == :belongs_to
      end

      it "should have one candidate" do
        donation = Donation.reflect_on_association(:candidate)
        donation.macro.should == :has_one
      end

      it "should not be valid unless they have a token" do
        FactoryGirl.build(:donation, token: nil).should_not be_valid
      end

      it "should not let a donor donate less than 10 dollars" do
        FactoryGirl.build(:donation, amount: "9").should_not be_valid
      end
    end
  end








