require 'spec_helper'

  describe Nomination do

    describe "Validations and Associations" do

      it "should belong to a campaign" do
        nomination = Nomination.reflect_on_association(:campaign)
        nomination.macro.should == :belongs_to
      end

      it "should have a candidate" do
        nomination = Nomination.reflect_on_association(:candidate)
        nomination.macro.should == :belongs_to
      end

      it "should have a candidate" do
        nomination = Nomination.reflect_on_association(:donor)
        nomination.macro.should == :belongs_to
      end
    end
  end


