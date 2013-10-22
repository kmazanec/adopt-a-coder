require "spec_helper"

describe DonorMailer do

  describe "#donation_mailer" do

    before(:each) do
      @donor = FactoryGirl.build(:donor, email: "newemail@gmail.com")
      @mail = DonorMailer.donation_mailer(@donor).deliver

    end

    it "should send the thankyou email to the correct email address" do


      @mail.to.should eq [@donor.email]
    end

     it "should send the thankyou email with the correct subject in the body" do


      @mail.subject.should eq "Thank you for Donating"
    end

    it "should be sent from adopt a coder" do


      @mail.from.should eq ['adopt.a.coder@gmail.com']
    end

    it 'ensure that the donors name is in the email body' do


      @mail.body.encoded.should match(@donor.name)
    end
  end

  describe "#welcome_email" do

    before(:each) do
      @donor = FactoryGirl.build(:donor, email: "welcometest@gmail.com")
      @mail = DonorMailer.welcome_email(@donor).deliver

    end

    it "should send the welcome email to the correct email address" do


      @mail.to.should eq [@donor.email]
    end

    it "should send the welcome email with the correct subject in the body" do


      @mail.subject.should eq "Welcome to Adopt.a.Coder.com"
    end

    it "should be sent from adopt a coder" do


      @mail.from.should eq ['adopt.a.coder@gmail.com']
    end

    it 'ensure that the donors name is in the thankyou email body' do


      @mail.body.encoded.should match(@donor.name)
    end
  end
end







