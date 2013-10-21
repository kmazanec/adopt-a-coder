require 'spec_helper'

describe SessionsController do

  describe '#logout' do

    before(:each) do

      @candidate = FactoryGirl.create(:candidate)
    end

    it "clears the session at logout" do
      delete :logout

      expect(session[:id]).to eq nil
    end

    it "flashes a notice on logout" do
      delete :logout

      flash[:success].should_not be_nil
    end

    it "redirects to root path" do
      delete :logout

      redirect_to root_path
    end
  end

  describe '#login' do

    before(:each) do
      @user = Candidate.create!(email: "user1@user.com", password: "password", password_confirmation: "password", city: "chicago", phone: "123-456-1234", state: "nj", zip: "6-60101", address1: "this place")
      @donor = Donor.create!(email: "useragfe1@user.com", password: "password", password_confirmation: "password", city: "chicagos", phone: "123-456-5234", state: "Il", zip: "60101", address1: "this place is awesome")

    end

    it "should set the session id to the to the user id" do
      post :login, { email: @user.email, password: "password" }

      expect(session[:id]).to eq @user.id
    end

    it "should redirect to the candidates profile page if user is a candidate" do
      post :login, { email: @user.email, password: "password" }

      response.should redirect_to(profile_candidate_path(@user))
    end

    it "should redirect to the donor profile page if user a donor" do
      post :login, { email: @donor.email, password: "password" }

      response.should redirect_to(donor_path(@donor))
    end

    it "should flash notice if the email or password is incorrect" do
      post :login, { email: @user.email, password: "password55" }

      flash[:error].should_not be_nil
      response.should redirect_to(root_path)
    end
  end

end
