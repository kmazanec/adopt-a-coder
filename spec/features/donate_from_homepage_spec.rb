require 'spec_helper'
include UserHelper

describe "Donating from the homepage" do

  before(:each) do
  visit root_path

  end

  it "should have a button the donate now", :js => true do

    click_link "Donate", match: :first
      fill_in 'payment-name', with: 'Uncle Sam'
      fill_in 'payment-email', with: 'unclesam@gmail.com'
      fill_in 'payment-amount', with: '120'
      fill_in 'payment-card', with: '4242424242424242'
      fill_in 'payment-cvc', with: '123'
      fill_in 'exp-month', with: '10'
      fill_in 'exp-year', with: '2015'
      fill_in 'payment-zip', with: '60601'

    click_button "Submit Transaction"
    page.should have_content "Thank You For Donating!"


  end

end
