require 'spec_helper'

describe PasswordResetsController do

  describe "#new" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "#create" do
    it "should send password instructions" do
      @user = FactoryGirl.create(:user)
      post 'create'

      flash[:notice].should eq "Email sent with password reset instructions."
      redirect_to root_url
    end
  end

  describe "#edit" do
    it "should tell user tell the user to reset password if the token is invalid" do
      @user = FactoryGirl.create(:user, password_reset_token: "anything", password_reset_sent_at: Time.now)
      @token = "somthing"
      get :edit, token: @token

      flash[:error].should eq "Please try to reset password again, token was invalid."
      redirect_to root_url
    end
  end

  describe "#update" do
      it "should not update the token if the token is invalid" do
      @user = FactoryGirl.create(:user, password_reset_token: "somthing", password_reset_sent_at: Time.now)
      @token = "somthing"
      get :update, token: @token

      flash[:success].should eq "Password has been reset."
    end
    it "should not update the token the request was over two hours" do
      @user = FactoryGirl.create(:user, password_reset_token: "somthing", password_reset_sent_at: 8.hour.ago)
      @token = "somthing"
      post :update, token: @token

      flash[:error].should eq "Password reset has expired."
    end

    it "should not update the token if the token is invalid" do
      @user = FactoryGirl.create(:user, password_reset_token: "anything", password_reset_sent_at: Time.now)
      @token = "somthing"
      get :update, token: @token

      flash[:error].should eq "Please try to reset password again, token was invalid."
    end
  end
end

