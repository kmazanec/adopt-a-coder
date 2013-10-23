require 'spec_helper'
include UserHelper

describe "Profile Page for candidate" do

  before(:each) do

    signup_as_candidate
  end


  it "should let you start your application" do

    page.should have_link "My Application"
  end

  it "should let you logout" do

    click_link "Logout"
    page.should have_link "Sign Up!"
  end

  it "should let you return to homepage" do


    page.should have_link "Adopt-a-Coder"
  end

  it "should show copyright" do

    within('footer') { expect(page).to have_content('Copyright') }
  end
end





