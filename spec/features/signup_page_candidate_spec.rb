require 'spec_helper'
include UserHelper

describe "Sign Up Page for candidate" do
  before(:each) do
    c = FactoryGirl.create(:candidate)
    m = Media.create!(url: "Adigo_small.jpg",
             type: "Image", user_id: c.id)
    f = Media.create!(url: "http://www.frankthomas.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
    c.update_attributes(profile_video_id: f.id)
    c.update_attributes(profile_photo_id: m.id)
    Campaign.create(candidate: c, start_date: "31/10/2013", end_date: "31/12/2013", total: 0, goal: 12500, current_campaign: true)
    question = FactoryGirl.create(:question)
  end

  it "should let me sign up as a candidate", :js => true do

    visit root_path
    click_link "Sign Up!"
    click_link "Interested in applying for a scholarship?", match: :first

      fill_in 'Name', with: 'Derrick Rosie'
      fill_in 'candidate_email', with: 'derrickrosie@gmail.com'
      fill_in 'candidate_password', with: 'numbertwo'
      fill_in 'candidate_password_confirmation', with: 'numbertwo'


      click_button "Create Candidate Profile"
      page.should have_content "View Public Profile"
      page.should have_content "About Me"
  end
end




