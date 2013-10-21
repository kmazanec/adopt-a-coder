require 'spec_helper'
include UserHelper

describe "Homepage" do

  before(:each) do
  visit root_path

  end


  it "should have a nav bar with various options" do

    find('nav').should have_link "Sign Up!"
    find('nav').should have_link "Login"
    find('nav').should have_link "Donate"
    find('nav').should have_content "Adopt-a-Coder"
  end

  it "should make donating simple" do

    page.should have_link("Donate")
  end

  it "should have a candidate we are currently funding" do

    page.should have_content("Currently funding...")
  end


  it "should show the copyright" do

    within('footer') { expect(page).to have_content('Copyright') }
  end
end





