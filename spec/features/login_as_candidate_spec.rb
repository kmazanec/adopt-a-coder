require 'spec_helper'
include UserHelper

describe "Login as a candidate from the homepage" do
  before(:each) do

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

