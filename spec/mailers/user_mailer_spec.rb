require "spec_helper"

describe UserMailer do

  describe "password_reset" do

    before(:each) do
      @user = FactoryGirl.create(:user, password_reset_token: "anything", password_reset_sent_at: Time.now)
      @mail = UserMailer.password_reset(@user).deliver
    end

    it "send user password reset url" do
      @mail.subject.should eq "Password Reset"
      @mail.to.should eq [@user.email]
      @mail.from.should eq ["adopt.a.coder@gmail.com"]
      @mail.body.encoded.should match(password_resets_verify_token_url(@user.password_reset_token))
    end
  end
end

