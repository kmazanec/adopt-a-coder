require 'spec_helper'

describe NominationsController do

  describe "#create" do

    it "should create and assign a nomination to a donor when they make a donation" do
      @campaign = FactoryGirl.create(:campaign)
      Campaign.stub(:current_campaign).and_return(@campaign)
      @donor = FactoryGirl.create(:donor)
      controller.stub(:current_user).and_return(@donor)
      @candidate = FactoryGirl.create(:candidate)
      @donation = FactoryGirl.create(:donation, campaign: @campaign)
      @donor.donations = [@donation]

      xhr :post, :create, :id => @candidate.id
      response.should be_success

      @parsed_body = JSON.parse(response.body)

      @parsed_body["message"].should eq "completed"
    end

    it "should not let the donor have a nominate if they dont have a nomination available" do
      @campaign = FactoryGirl.create(:campaign)
      Campaign.stub(:current_campaign).and_return(@campaign)
      @donor = FactoryGirl.create(:donor)
      controller.stub(:current_user).and_return(@donor)
      @candidate = FactoryGirl.create(:candidate)
      @donation = FactoryGirl.create(:donation, campaign: @campaign)
      @nomination = FactoryGirl.create(:nomination, campaign: @campaign, donor: @donor, candidate: @candidate)
      @donor.donations = [@donation]
      @donor.nominations = [@nomination]

      xhr :post, :create, :id => @candidate.id
      response.should be_success

      @parsed_body = JSON.parse(response.body)

      @parsed_body["message"].should eq "unable"
    end

    it "should error out if the nomination is invalid" do
      @campaign = FactoryGirl.create(:campaign)
      Campaign.stub(:current_campaign).and_return(@campaign)
      @donor = FactoryGirl.create(:donor)
      controller.stub(:current_user).and_return(@donor)
      @candidate = FactoryGirl.create(:candidate)
      @donation = FactoryGirl.create(:donation, campaign: @campaign)
      @donor.donations = [@donation]



      xhr :post, :create, :id => 5
      response.should be_success

      @parsed_body = JSON.parse(response.body)

      @parsed_body["message"].should eq "error"
    end
  end
end



