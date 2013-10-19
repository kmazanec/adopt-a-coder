require 'spec_helper'
include UserHelper

describe "Profile Page for donor" do

  before(:each) do
    login_as_donor

  end

  it "should have donators name recent donations and candidates they have nominated" do

    page.should have_content "Candidates You've Nominated"
    page.should have_content "Recent Donations"
    page.should have_content "Candidates You've Nominated"
  end

  it "should let you log out" do

    click_link "Logout"
    page.should have_link "Sign Up!"
  end

  it "should let you return to homepage" do


    page.should have_link "Home"
  end

  it "should show copyright" do

    within('footer') { expect(page).to have_content('Copyright') }
  end

end
