#Selenium test currently not working


# require 'spec_helper'
# include UserHelper

# describe "Donating from the homepage" do

#   before(:each) do
#     c = FactoryGirl.create(:candidate)
#     m = Media.create(url: "Adigo_small.jpg",
#              type: "Image", user_id: c.id)
#     f = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
#              type: "Video", user_id: c.id)
#     c.update_attributes(profile_video_id: f.id)
#     c.update_attributes(profile_photo_id: m.id)
#     Campaign.create(candidate: c, start_date: "31/10/2013", end_date: "31/12/2013", total: 0, goal: 12500, current_campaign: true)
#     question = FactoryGirl.create(:question)
#     visit root_path
#   end

#   it "should have a button the donate now that allows you to donate", :js => true do

#     click_link "Contribute"
#       fill_in 'payment-name', with: 'Uncle Sam'
#       fill_in 'payment-email', with: 'unclesam@gmail.com'
#       fill_in 'payment-amount', with: '120'
#       fill_in 'payment-card', with: '4242424242424242'
#       fill_in 'payment-cvc', with: '123'
#       fill_in 'exp-month', with: '10'
#       fill_in 'exp-year', with: '2015'
#       fill_in 'payment-zip', with: '60601'

#     click_button "Submit Transaction"
#     page.should have_content "Thank You For Donating!"
#   end

# end


