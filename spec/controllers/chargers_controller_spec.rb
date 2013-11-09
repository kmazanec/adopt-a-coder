require 'spec_helper'
require 'stripe_mock'


describe ChargesController do
  before(:each) do
    StripeMock.start
  end

    it "should generate a stripe card token" do
      card_token = StripeMock.generate_card_token(last4: "9191", exp_year: 1984)
      cus = Stripe::Customer.create(card: card_token)
      card = cus.cards.data.first
      expect(card.last4).to eq("9191")
      expect(card.exp_year).to eq(1984)
    end

  describe "#create" do

    it "should generate a stripe card token" do
      card_token = StripeMock.generate_card_token(last4: "9191", exp_year: 1984)
      cus = Stripe::Customer.create(card: card_token)
      card = cus.cards.data.first
      @candidate = FactoryGirl.create(:candidate)
      @campaign = FactoryGirl.create(:campaign)
      @donor = FactoryGirl.create(:donor)
      controller.stub(:current_campaign).and_return(@campaign)
      controller.stub(:current_candidate).and_return(@candidate)
      post 'create', email: @donor.email
      flash[:success].should eq "Your donation was successful!  Thank you!  Please log in to make a nomination."
    end
  end
end

