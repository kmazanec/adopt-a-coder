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

      describe "#nomination_available?" do
        it "should check to see if there are nominations avaliable" do
          @donor = FactoryGirl.build(:donor, name: "steve jobs")
          @available= @donor.nomination_available?

          @available.should eq true
        end
      end

      describe "#current_campaign_donation?" do
        it "should show the campaign the donor has donated to if they have any " do
          @campaign = FactoryGirl.create(:campaign)
          @donor = FactoryGirl.create(:donor)
          @donation = FactoryGirl.create(:donation)
          @campaign.donations = [@donation]
          @donor.donations = [@donation]

          Campaign.stub(:current_campaign).and_return(@campaign)

          @result = @donor.current_campaign_donation?

          @result.should eq true
        end
      end
    end
  end



