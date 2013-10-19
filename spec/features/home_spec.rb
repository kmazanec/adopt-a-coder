require 'spec_helper'
include UserHelper

describe "Homepage" do

  before(:each) do
  visit root_path

  end


  it "should have a nav bar with various options" do

    find('nav').should have_link "Home"
    find('nav').should have_link "Sign Up"
  end

  it "should make donating simple" do

    page.should have_button("Donate")
  end


  it "should show the copyright" do

    within('footer') { expect(page).to have_content('Copyright') }
  end

end




