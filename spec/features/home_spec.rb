require 'spec_helper'
include UserHelper

describe "Homepage" do

  before(:each) do
    c = FactoryGirl.create(:candidate)
    m = Media.create!(url: "Adigo_small.jpg",
             type: "Image", user_id: c.id)
    f = Media.create!(url: "http://www.espn.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
    c.update_attributes(profile_video_id: f.id)
    c.update_attributes(profile_photo_id: m.id)
    Campaign.create(candidate: c, start_date: "31/10/2013", end_date: "31/12/2013", total: 0, goal: 12500, current_campaign: true)
    question = FactoryGirl.create(:question)
    application = FactoryGirl.create(:application)
    visit root_path
  end


  it "should have a nav bar with various options", :js => true do

    find('nav').should have_link "Adopt-a-Coder"
    find('nav').should have_link "Sign Up!"
    find('nav').should have_link "Contribute"
    find('nav').should have_content "Login"
  end
  it "should show FAQs when I click faq", :js => true do

    click_link "FAQ"
    page.should have_content "When is my card charged?"
  end

  it "should have 3 Contribute button", :js => true do

    page.should have_link('Contribute', :count => 3)
  end

  it "should let you Contribute", :js => true do
    click_link "Contribute", match: :first
    page.should have_content "Make a donation"
  end

  it "should let you Login", :js => true do
    click_link "Login", match: :first
    page.should have_content "Email"
  end

  it "should have a candidate we are currently funding", :js => true do

    page.should have_content("Currently crowd-funding a scholarship for")
  end

  it "should let you Sign up", :js => true do
    click_link "Sign Up!", match: :first
    page.should have_content "Interested in being a supporter?"
  end

end






