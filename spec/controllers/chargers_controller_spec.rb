require 'spec_helper'
require 'stripe_mock'


describe ChargesController do
  before(:each) do
    StripeMock.start
  end
  after(:each) do
    StripeMock.stop
  end

    describe "making a stripe card" do

      it "should generate a stripe card token" do
        card_token = StripeMock.generate_card_token(last4: "9191", exp_year: 1984)
        cus = Stripe::Customer.create(card: card_token)
        card = cus.cards.data.first
        expect(card.last4).to eq("9191")
        expect(card.exp_year).to eq(1984)
      end
    end

  describe "#create" do

    it "should generate flash notice on successul donation" do
      card_token = StripeMock.generate_card_token(last4: "9191", exp_year: 2022)
      cus = Stripe::Customer.create(card: card_token)
      card = cus.cards.data.first
      @candidate = FactoryGirl.create(:candidate)
      @campaign = FactoryGirl.create(:campaign)
      @donor = FactoryGirl.create(:donor)
      controller.stub(:current_campaign).and_return(@campaign)
      controller.stub(:current_candidate).and_return(@candidate)
      post 'create', email: @donor.email
      flash[:success].should eq "Your donation was successful!  Thank you!  Please log in to make a nomination."
      response.should render_template(:_donation_confirmation)
    end
  end

  describe "errors" do

    it "raises a custom error for specific actions" do
      custom_error = StandardError.new("Your card could not be verified, please use a different form of payment.")

      StripeMock.prepare_error(custom_error, :new_customer)

      expect { Stripe::Charge.create }.to_not raise_error
      expect { Stripe::Customer.create }.to raise_error {|e|
        expect(e).to be_a StandardError
        expect(e.message).to eq("Your card could not be verified, please use a different form of payment.")
      }
    end

    it "mocks a declined card error" do
      StripeMock.prepare_card_error(:card_declined)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('card_declined')
      }
    end

    it "should flash a declined card custom error" do
      StripeMock.prepare_card_error(:card_declined)

      @candidate = FactoryGirl.create(:candidate)
      @campaign = FactoryGirl.create(:campaign)
      @donor = FactoryGirl.create(:donor)
      controller.stub(:current_campaign).and_return(@campaign)
      controller.stub(:current_candidate).and_return(@candidate)
      post 'create', email: @donor.email
      flash[:error].should eq "Your card could not be verified, please try a different form of payment."
      response.should redirect_to(root_path)
    end

    it "mocks a incorrect number card error" do
      StripeMock.prepare_card_error(:incorrect_number)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('incorrect_number')
      }
    end

    it "mocks a invalid number card error" do
      StripeMock.prepare_card_error(:invalid_number)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('invalid_number')
      }
    end

     it "mocks a invalid expiry month error" do
      StripeMock.prepare_card_error(:invalid_expiry_month)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('invalid_expiry_month')
      }
    end

    it "mocks a invalid expiry year error" do
     StripeMock.prepare_card_error(:invalid_expiry_year)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('invalid_expiry_year')
      }
    end

    it "mocks a invalid cvc error" do
     StripeMock.prepare_card_error(:invalid_cvc)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('invalid_cvc')
      }
    end

    it "mocks an expired card" do
     StripeMock.prepare_card_error(:expired_card)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('expired_card')
      }
    end

    it "mocks a incorrect cvc" do
     StripeMock.prepare_card_error(:incorrect_cvc)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('incorrect_cvc')
      }
    end

    it "mocks card declined" do
     StripeMock.prepare_card_error(:card_declined)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('card_declined')
      }
    end

    it "mocks params missing" do
     StripeMock.prepare_card_error(:missing)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('missing')
      }
    end

    it "mocks processing error" do
     StripeMock.prepare_card_error(:processing_error)

      expect { Stripe::Charge.create }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('processing_error')
      }
    end
  end
end





