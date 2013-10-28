require 'spec_helper'
include UserHelper

describe "Login as a candidate from the homepage" do
  before(:each) do
    c = FactoryGirl.create(:candidate)
    m = Media.create(url: "Adigo_small.jpg",
             type: "Image", user_id: c.id)
    f = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
    c.update_attributes(profile_video_id: f.id)
    c.update_attributes(profile_photo_id: m.id)
    Campaign.create(candidate: c, start_date: "31/10/2013", end_date: "31/12/2013", total: 0, goal: 12500, current_campaign: true)
    signup_as_candidate
    click_link "Logout"
  end

  it "should let you login as a candidate if you have a profile" do
    visit root_path
    click_link "Login"
      fill_in 'email', with: 'derrickrose@gmail.com', match: :first
      fill_in 'password', with: 'numberone'
      click_button "Login"
      page.should have_content "Derrick Rose"
  end
end

