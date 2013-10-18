When(/^I click Donate$/) do
  click_button "Donate"
end

Then(/^I should be able to donate$/) do
  response.should render_template(:partial => 'partial_name')
end
