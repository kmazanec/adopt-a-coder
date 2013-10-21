require 'spec_helper'
include UserHelper

describe "Profile Page for candidate" do

  before(:each) do
    login_as_candidate
  end


  it "should let you start your application" do

    page.should have_link "Application Form"
  end

  it "should let you sumbit your application" do

    page.should have_link "Submit Application"
  end

  it "should show copyright" do

    within('footer') { expect(page).to have_content('Copyright') }
  end
end




