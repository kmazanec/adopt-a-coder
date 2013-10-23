require 'spec_helper'

  describe Donor do

    describe "Validations and Associations" do

      it "should have many donations" do
        donor = Donor.reflect_on_association(:donations)
        donor.macro.should == :has_many
      end

      it "should have many campaigns" do
        donor = Donor.reflect_on_association(:campaigns)
        donor.macro.should == :has_many
      end

      it "should have many nominations" do
        donor = Donor.reflect_on_association(:nominations)
        donor.macro.should == :has_many
      end

      it "should NOT be valid if password and password confirmation dont match" do
        FactoryGirl.build(:donor, password_confirmation: "not password").should_not be_valid
      end

      it "should not be valid without proper email syntax" do
        FactoryGirl.build(:donor, email: 'bob.com').should_not be_valid
      end

      it  "should have a unique email" do
        user = FactoryGirl.create(:donor)
        FactoryGirl.create(:donor, email: "scott@gmail.com")
        FactoryGirl.build(:donor, email: "scott@gmail.com").should_not be_valid
      end

      it "should have an email" do
        FactoryGirl.build(:donor, email: nil).should_not be_valid
      end

      it "should have a password" do
        FactoryGirl.build(:donor, password: nil).should_not be_valid
      end

      describe "#current_campaign_donation?" do
        it "returns true if they have donated to Campaign.current_campaign" do
          @donor = FactoryGirl.create(:donor)
          @campaign = FactoryGirl.create(:campaign)
          @donation = FactoryGirl.create(:donation, donor: @donor, campaign: @campaign)

          Campaign.stub(:current_campaign).and_return(@campaign)

          @result = @donor.current_campaign_donation?

          @result.should eq true
        end
      end

      describe "#nomination_available?" do

        it "should return true if the donor has a nomination available" do
          @campaign = FactoryGirl.create(:campaign)
          Campaign.stub(:current_campaign).and_return(@campaign)
          @donation = FactoryGirl.create(:donation, campaign: @campaign)
          @donor = FactoryGirl.create(:donor)
          @donor.donations = [@donation]

          @result = @donor.nomination_available?

          @result.should eq true
        end

        it "should return false if the donor has already nominationed a donor" do
          @campaign = FactoryGirl.create(:campaign)
          Campaign.stub(:current_campaign).and_return(@campaign)
          @candidate = FactoryGirl.create(:candidate)
          @donation = FactoryGirl.create(:donation, campaign: @campaign)
          @donor = FactoryGirl.create(:donor)
          @nomination = FactoryGirl.create(:nomination, campaign: @campaign, donor: @donor, candidate: @candidate)
          @donor.donations = [@donation]
          @donor.nominations = [@nomination]

          @result = @donor.nomination_available?

          @result.should eq false
        end

        it "should return false if the donor has never donated" do
          @campaign = FactoryGirl.create(:campaign)
          Campaign.stub(:current_campaign).and_return(@campaign)
          @donation = FactoryGirl.create(:donation, campaign: @campaign)
          @donor = FactoryGirl.create(:donor)

          @result = @donor.nomination_available?

          @result.should eq false
        end
      end
    end
  end










