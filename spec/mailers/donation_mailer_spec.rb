require "spec_helper"

describe DonationMailer do

  describe "#existing_donation_mailer" do

    before(:each) do
      @donor = FactoryGirl.build(:donor, email: "newemail@gmail.com", password_reset_token: "somthing")
      @candidate = FactoryGirl.create(:candidate)
      @donation = FactoryGirl.create(:donation)
      @mail = DonationMailer.existing_donor_mailer(@donor, @candidate, @donation).deliver

    end

    it "should send the email to the correct email address from the candidate" do


      @mail.to.should eq [@donor.email]
    end

    it "should send the thankyou email with the correct subject in the body" do


      @mail.subject.should eq "Thank You For Donating"
    end

    it "should be sent from adopt a coder" do


      @mail.from.should eq ['dbcadoptacoder@gmail.com']
    end

    it 'ensure that the candidates name is in the email body' do


      @mail.body.encoded.should match(@candidate.name)
    end
  end
end



