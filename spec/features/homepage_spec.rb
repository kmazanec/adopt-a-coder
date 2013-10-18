require 'spec_helper'

describe "Homepage" do
  before(:each) do
  visit root_path
  end

  it "should have Adopt A Coder in the heading" do

    find('h1').should have_content "AdoptACoder"
  end

  it "should have a nav bar with various options" do

    find('nav').should have_content "How it works"
  end

  it "should make donating simple" do

    page.has_content?("Donante")
  end

  it "should show how this works when I click How this works" do

    click_link "How this works"
    expect(response).to render_template(:partial => '_about.html.erb')
  end

  it 'should have link to facebook' do

    click_link "Share on Facebook"
    page.should have_content "Share This Link"
  end

  it "should show the copyright" do

    within('footer') { expect(page).to have_content('Copyright') }
  end

end
