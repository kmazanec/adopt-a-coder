require 'spec_helper'
include UserHelper

describe "Sign Up Page for candidate" do

  it "should let me sign up as a candidate" do
    visit root_path
    click_link "Sign Up!"
    click_link "Interested in applying?"

      fill_in 'Name', with: 'Derrick Rosie'
      fill_in 'candidate_email', with: 'derrickrosie@gmail.com'
      fill_in 'candidate_phone', with: '123-565-1887'
      fill_in 'candidate_password', with: 'numbertwo'
      fill_in 'candidate_password_confirmation', with: 'numbertwo'
      fill_in 'candidate_address1', with: 'trump towers'
      fill_in 'candidate_address2', with: 'englewoods'
      fill_in 'candidate_city', with: 'chicagoo'
      fill_in 'candidate_state', with: 'IL'
      fill_in 'candidate_zip', with: '606001'

      click_button "Create Profile"
      page.should have_content "Derrick Rosie"
      page.should have_content "Profile Page"
  end

  it "should show the copyright" do
    visit root_path
    click_link "Sign Up!"
    click_link "Interested in applying?"

    within('footer') { expect(page).to have_content('Copyright') }
  end
end



