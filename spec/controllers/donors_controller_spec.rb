require 'spec_helper'

describe DonorsController do

  before(:each) do
    @donor = FactoryGirl.create(:donor)
    controller.stub(:current_user).and_return(@donor)
  end

  describe "#create" do

    it 'should be an instatance of donor' do

      @donor.should be_an_instance_of Donor
    end

    it "should be able to create a new donor" do

      expect { post 'create', :donor => { "email" => "micheal@gmail.com",
        "name" => "Derrick Rose", "phone" => "555-233-6541","password" => "Password1",
        "password_confirmation" => "Password1", "address1" => "224 north illinois",
        "address2" => "apt 6002", "city" => "Chicago", "state" => "IL", "zip" => "06061",
        "twitter" => "kevin@twitter.com", "facebook" => "Rosie@facebook.com",
        "linked_in" => "kevin@linked in", "codeacademy" => "badges", "github" => "kevin@github.com",
        "blog" => "tumblerkevin@tumblr.com", "personal_url" => "kevin@tumblr.com",
        "currently_working_on" => "codes  academy", "biography" => "from the north side yo",
        "mission" => "become a great coder too", "profile_photo_id" => "2",
        "profile_video_id" => "2", "type" => "Candidate"} }.to change(Donor, :count).by(1)

        response.should redirect_to(donor_path(Donor.last))
    end

    it "should set session id" do

      expect { post 'create', :donor => { "email" => "pippen@gmail.com",
        "name" => "russell crowe", "phone" => "555-233-6541","password" => "Password1",
        "password_confirmation" => "Password1", "address1" => "224 north illinois",
        "address2" => "apt 6002", "city" => "Chicago", "state" => "IL", "zip" => "06061",
        "twitter" => "kevin@twitter.com", "facebook" => "vinnie@facebook.com",
        "linked_in" => "kevin@linked in", "codeacademy" => "badges", "github" => "kevin@github.com",
        "blog" => "tumblerkevin@tumblr.com", "personal_url" => "kevin@tumblr.com",
        "currently_working_on" => "codes  academy", "biography" => "from the north side yo",
        "mission" => "become a great coder too", "profile_photo_id" => "2",
        "profile_video_id" => "2", "type" => "Candidate"} }.to change(Donor, :count).by(1)

        session[:id].should eq Donor.last.id
    end

    it "should render the new view if the candidate doesnt save" do

      expect { post 'create', :donor => { "email" => "",
        "name" => "shouldnt work", "phone" => "555-233-6541","password" => "Password1",
        "password_confirmation" => "Password1", "address1" => "224 north illinois",
        "address2" => "apt 6002", "city" => "", "state" => "IL", "zip" => "06061",
        "twitter" => "kevin@twitter.com", "facebook" => "kevin@facebook.com",
        "linked_in" => "kevin@linked in", "codeacademy" => "badges", "github" => "kevin@github.com",
        "blog" => "tumblerkevin@tumblr.com", "personal_url" => "kevin@tumblr.com",
        "currently_working_on" => "codes  academy", "biography" => "from the north side yo",
        "mission" => "become a great coder too", "profile_photo_id" => "2",
        "profile_video_id" => "2", "type" => "Candidate"} }.to_not change(Donor, :count).by(1)

        response.should render_template(:new)
    end

    it "should have a flash notice if params are missing" do

        expect { post 'create', :donor => { "email" => "",
          "name" => "scott mascio", "phone" => "555-233-6541","password" => "Password1",
          "password_confirmation" => "Password1", "address1" => "224 north illinois",
          "address2" => "apt 6002", "city" => "", "state" => "IL", "zip" => "06061",
          "twitter" => "kevin@twitter.com", "facebook" => "kevin@facebook.com",
          "linked_in" => "kevin@linked in", "codeacademy" => "badges", "github" => "kevin@github.com",
          "blog" => "tumblerkevin@tumblr.com", "personal_url" => "kevin@tumblr.com",
          "currently_working_on" => "codes  academy", "biography" => "from the north side yo",
          "mission" => "become a great coder too", "profile_photo_id" => "2",
          "profile_video_id" => "2", "type" => "Candidate"} }.to_not change(Donor, :count).by(1)

          flash[:error].should_not be_nil
          response.should render_template(:new)
    end
  end

  describe "#new" do

    it "should render create view" do
        get 'new'

        response.should render_template(:new)
    end

  end

  describe "#show" do

    it "should show the profile view" do
      get :show, :id => @donor.id

      response.should render_template(:show)
    end

    it "should redirect home if your not logged in" do
      @candidate = FactoryGirl.create(:candidate)
      controller.stub(:current_user).and_return(@candidate)
      get :show, :id => @candidate

      redirect_to root_path
    end



  end


end
