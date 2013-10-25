require 'spec_helper'

describe CandidatesController do


  describe "#create" do
    before do
      @params = { "email" => "scott@gmail.com",
                  "name" => "Scott M", "phone" => "555-233-6541","password" => "Password1",
                  "password_confirmation" => "Password1", "address1" => "224 north illinois",
                  "address2" => "apt 6002", "city" => "Chicago", "state" => "IL", "zip" => "06061",
                  "twitter" => "kevin@twitter.com", "facebook" => "kevin@facebook.com",
                  "linked_in" => "kevin@linked in", "codeacademy" => "badges", "github" => "kevin@github.com",
                  "blog" => "tumblerkevin@tumblr.com", "personal_url" => "kevin@tumblr.com",
                  "currently_working_on" => "codes  academy", "biography" => "from the north side yo",
                  "mission" => "become a great coder too", "profile_photo_id" => "2",
                  "profile_video_id" => "2", "type" => "Candidate"}
    end

    context "valid params" do
      before do
        post 'create', :candidate => @params

        @candidate = Candidate.find_by(email: "scott@gmail.com")
      end

      it "redirect to the new canidate's page" do
        response.should redirect_to(profile_candidate_path(@candidate))
      end

      it "should set session id" do
        session[:id].should eq @candidate.id
      end


    end

    context "invalid params" do
      before do
        @params['email'] = nil
        post 'create', :candidate => @params
      end

      it "should not save the new candidate" do
        Candidate.find_by(email: "scott@gmail.com").should be_nil
      end

      it "should have a flash notice if params are missing" do
        flash[:error].should_not be_nil
        response.should render_template(:new)
      end

      it "should render the new view if the candidate doesnt save" do
        response.should render_template(:new)
      end
    end
  end


  describe "#new" do


    it "should render create view" do

      get 'new'

        response.should render_template(:new)
    end

  end

  describe "#show" do
    before(:each) do
     @candidate = FactoryGirl.create(:candidate)
   end

    it "should show the candidate profile view" do

      get :show, :id => @candidate.id

      response.should render_template(:show)
   end

  end

  describe "#index" do
    it "should show the all the candates" do

      get :index

      response.should render_template(:index)
   end

  end

  describe "#update" do
    before(:each) do
     @candidate = FactoryGirl.create(:candidate)
   end
     it 'should update mission statment for candidate' do

      controller.stub(:current_user).and_return(@candidate)

      patch :update, id: @candidate.id, candidate: {:mission => "become a coder"}

      @candidate.reload.mission.should eq "become a coder"
      response.should redirect_to(profile_candidate_path(@candidate))
    end
  end
end





