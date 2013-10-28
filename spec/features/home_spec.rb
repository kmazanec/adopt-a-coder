require 'spec_helper'
include UserHelper

describe "Homepage" do

  before(:each) do
    c = FactoryGirl.create(:candidate)
    m = Media.create(url: "Adigo_small.jpg",
             type: "Image", user_id: c.id)
    f = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
    c.update_attributes(profile_video_id: f.id)
    c.update_attributes(profile_photo_id: m.id)
    Campaign.create(candidate: c, start_date: "31/10/2013", end_date: "31/12/2013", total: 0, goal: 12500, current_campaign: true)
    visit root_path

  end


  it "should have a nav bar with various options" do

    find('nav').should have_link "Adopt-a-Coder"
    find('nav').should have_link "Sign Up!"
    find('nav').should have_link "Contribute"
    find('nav').should have_content "Login"
  end

  it "should make donating simple" do

    page.should have_link("Donate")
  end

  it "should have a candidate we are currently funding" do

    page.should have_content("Currently supporting")
  end


  it "should show the copyright" do

    within('footer') { expect(page).to have_content('Copyright') }
  end
end





