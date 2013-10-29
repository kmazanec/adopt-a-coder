require 'spec_helper'
include UserHelper

describe "Profile Page for candidate" do

  before(:each) do
    c = FactoryGirl.create(:candidate)

    m = Media.create!(url: "derrickrose.jpg",
             type: "Image", user_id: c.id)
    f = Media.create!(url: "http://www.grantland.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
    c.update_attributes(profile_video_id: f.id)
    c.update_attributes(profile_photo_id: m.id)
    Campaign.create(candidate: c, start_date: "31/10/2013", end_date: "31/12/2013", total: 0, goal: 12500, current_campaign: true)
    question = FactoryGirl.create(:question)
    signup_as_candidate
  end


  it "should let you start your application" do

    page.should have_link "My Application"
  end

  it "should let you logout" do

    click_link "Logout"
    page.should have_link "Sign Up!"
  end

  it "should let you return to homepage" do


    page.should have_link "Adopt-a-Coder"
  end

end






