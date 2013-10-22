require 'spec_helper'
include UserHelper

describe "Sign Up Page for donor" do

  it "should let you sign up as a donator" do
    visit root_path
    click_link "Sign Up!"
    click_link "Interested in being a supporter?", match: :first

      fill_in 'Name', with: 'Scott'
      fill_in 'donor_email', with: 'pippen@gmail.com'
      fill_in 'donor_password', with: 'bah'
      fill_in 'donor_password_confirmation', with: 'bah'

    click_button "Create Donor"
    page.should have_content "Candidates You've Nominated"
    page.should have_content "Scott"

  end

  it "should show the copyright" do
    visit root_path
    click_link "Sign Up!"
    click_link "Interested in being a supporter?", match: :first

    within('footer') { expect(page).to have_content('Copyright') }
  end
end





