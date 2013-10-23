require 'spec_helper'
include UserHelper

describe "Sign Up Page for candidate" do

  it "should let me sign up as a candidate" do

    visit root_path
    click_link "Sign Up!"
    click_link "Interested in applying?", match: :first

      fill_in 'Name', with: 'Derrick Rosie'
      fill_in 'candidate_email', with: 'derrickrosie@gmail.com'
      fill_in 'candidate_password', with: 'numbertwo'
      fill_in 'candidate_password_confirmation', with: 'numbertwo'


      click_button "Create Profile"
      page.should have_content "Derrick Rosie's Profile"
      page.should have_content "Mission Statement"
  end

  it "should show the copyright" do

    visit root_path
    click_link "Sign Up!"
    click_link "Interested in applying?", match: :first

    within('footer') { expect(page).to have_content('Copyright') }
  end
end




