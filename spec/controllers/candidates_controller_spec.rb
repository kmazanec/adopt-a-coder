require 'spec_helper'

describe CandidatesController do

  before(:each) do
    @candidate = FactoryGirl.create(:candidate)
  end

  describe "#create" do

    it 'should be an instatance of candidate' do

      @candidate.should be_an_instance_of Candidate
    end

    it "should be able to create a new candidate" do

      expect { post 'create', :candidate => { "email" => "scott@gmail.com",
        "name" => "Scott M", "phone" => "555-233-6541","password" => "Password1",
        "password_confirmation" => "Password1", "address1" => "224 north illinois",
        "address2" => "apt 6002", "city" => "Chicago", "state" => "IL", "zip" => "06061",
        "twitter" => "kevin@twitter.com", "facebook" => "kevin@facebook.com",
        "linked_in" => "kevin@linked in", "codeacademy" => "badges", "github" => "kevin@github.com",
        "blog" => "tumblerkevin@tumblr.com", "personal_url" => "kevin@tumblr.com",
        "currently_working_on" => "codes  academy", "biography" => "from the north side yo",
        "mission" => "become a great coder too", "profile_photo_id" => "2",
        "profile_video_id" => "2", "type" => "Candidate"} }.to change(Candidate, :count).by(1)

        response.should redirect_to(candidate_path(Candidate.last))
    end

    it "should set session id" do

      expect { post 'create', :candidate => { "email" => "scott@gmail.com",
        "name" => "Scott M", "phone" => "555-233-6541","password" => "Password1",
        "password_confirmation" => "Password1", "address1" => "224 north illinois",
        "address2" => "apt 6002", "city" => "Chicago", "state" => "IL", "zip" => "06061",
        "twitter" => "kevin@twitter.com", "facebook" => "kevin@facebook.com",
        "linked_in" => "kevin@linked in", "codeacademy" => "badges", "github" => "kevin@github.com",
        "blog" => "tumblerkevin@tumblr.com", "personal_url" => "kevin@tumblr.com",
        "currently_working_on" => "codes  academy", "biography" => "from the north side yo",
        "mission" => "become a great coder too", "profile_photo_id" => "2",
        "profile_video_id" => "2", "type" => "Candidate"} }.to change(Candidate, :count).by(1)

        session[:id].should eq Candidate.last.id
    end

    it "should render the new view if the candidate doesnt save" do
      expect { post 'create', :candidate => { "email" => "",
        "name" => "scott mascio", "phone" => "555-233-6541","password" => "Password1",
        "password_confirmation" => "Password1", "address1" => "224 north illinois",
        "address2" => "apt 6002", "city" => "", "state" => "IL", "zip" => "06061",
        "twitter" => "kevin@twitter.com", "facebook" => "kevin@facebook.com",
        "linked_in" => "kevin@linked in", "codeacademy" => "badges", "github" => "kevin@github.com",
        "blog" => "tumblerkevin@tumblr.com", "personal_url" => "kevin@tumblr.com",
        "currently_working_on" => "codes  academy", "biography" => "from the north side yo",
        "mission" => "become a great coder too", "profile_photo_id" => "2",
        "profile_video_id" => "2", "type" => "Candidate"} }.to_not change(Candidate, :count).by(1)


        response.should render_template(:new)
    end

    it "should have a flash notice if params are missing" do
        expect { post 'create', :candidate => { "email" => "",
          "name" => "scott mascio", "phone" => "555-233-6541","password" => "Password1",
          "password_confirmation" => "Password1", "address1" => "224 north illinois",
          "address2" => "apt 6002", "city" => "", "state" => "IL", "zip" => "06061",
          "twitter" => "kevin@twitter.com", "facebook" => "kevin@facebook.com",
          "linked_in" => "kevin@linked in", "codeacademy" => "badges", "github" => "kevin@github.com",
          "blog" => "tumblerkevin@tumblr.com", "personal_url" => "kevin@tumblr.com",
          "currently_working_on" => "codes  academy", "biography" => "from the north side yo",
          "mission" => "become a great coder too", "profile_photo_id" => "2",
          "profile_video_id" => "2", "type" => "Candidate"} }.to_not change(Candidate, :count).by(1)

          flash[:notice].should_not be_nil
          response.should render_template(:new)
    end

  end

  describe "#new" do


    it "should render create view" do
      get 'new'

        response.should render_template(:new)
    end

  end


end
