
require 'spec_helper'

  describe Candidate do

    describe "Validations and Associations" do

      it "should have one application" do
        candidate = Candidate.reflect_on_association(:application)
        candidate.macro.should == :has_one
      end

      it "should have many responses" do
        candidate = Candidate.reflect_on_association(:responses)
        candidate.macro.should == :has_many
      end

      it "should have many nominations" do
        candidate = Candidate.reflect_on_association(:nominations)
        candidate.macro.should == :has_many
      end

      it "should NOT be valid if password and password confirmation dont match" do
        FactoryGirl.build(:candidate, password: "not password").should_not be_valid
      end

      it "should not be valid without proper email syntax" do
        FactoryGirl.build(:candidate, email: 'bob.com').should_not be_valid
      end

      it  "should have a unique email" do
        user = FactoryGirl.create(:donor)
        FactoryGirl.create(:candidate, email: "scott@gmail.com")
        FactoryGirl.build(:candidate, email: "scott@gmail.com").should_not be_valid
      end

      it "should have an email" do
        FactoryGirl.build(:candidate, email: nil).should_not be_valid
      end

      it "should have a password" do
        FactoryGirl.build(:candidate, password: nil).should_not be_valid
      end
    end

    describe "#search" do

      it "should return all candidates what match the query" do
        @candidate = FactoryGirl.create(:candidate)
        @query = Candidate.search("Kevin second")

        @query.should eq [@candidate]
      end
    end
  end




