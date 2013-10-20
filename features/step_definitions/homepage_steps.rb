Given(/^I am not logged in$/) do
  visit root_path
end

When(/^I go to the rootpage$/) do
  visit root_path
end

Then(/^I should see the most recent candidate$/) do
  page.should have_content "Currently funding..."
end

Then(/^I should see a how this works section$/) do
  page.should have_content "How this works"
end

Then(/^i should see frequently asked questions$/) do
  page.should have_content "Frequently Asked Questions"
end

Then(/^I should see the most recent donations$/) do
  page.should have_content "Recent Donations"
end

