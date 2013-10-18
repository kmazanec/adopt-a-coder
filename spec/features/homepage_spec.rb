require 'spec_helper'

describe "Homepage" do
  before(:each) do
  visit root_path
  end

  it "should have Adopt A Coder in the heading" do
    find('h1').should have_content "AdoptACoder"
  end

  it "should have a nav bar with various options" do

    find('nav').should have_content "How does this work?"
  end

  it "should make donating simple" do

    page.has_content?("Donante")
  end

  it "should show how this works when I click How this works" do

    click_link "How this works"
    expect(response).to render_template(:partial => '_about.html.erb')
  end



  it "should show th copyright" do

    within('footer') { expect(page).to have_content('Copyright') }
  end

end
