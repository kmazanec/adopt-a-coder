require 'spec_helper'
include UserHelper

describe "Profile Page for donor" do

  before(:each) do
    c = FactoryGirl.create(:candidate)
    m = Media.create!(url: "Adigo_small.jpg",
             type: "Image", user_id: c.id)
    f = Media.create!(url: "http://www.youte.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
    c.update_attributes(profile_video_id: f.id)
    c.update_attributes(profile_photo_id: m.id)
    Campaign.create(candidate: c, start_date: "31/10/2013", end_date: "31/12/2013", total: 0, goal: 12500, current_campaign: true)
    question = FactoryGirl.create(:question)
    signup_as_donor
  end

  it "should have donators name recent donations and candidates they have nominated", :js => true do

    page.should have_content "Your Nominee"
    page.should have_content "Contributon History"
    page.should have_content "Your Previous Nominees"
  end

  it "should let you log out", :js => true do

    click_link "Logout"
    page.should have_link "Sign Up!"
  end

  it "should let you return to homepage", :js => true do


    page.should have_link "Adopt-a-Coder"
  end
end

