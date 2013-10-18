Given(/^I am at the homepage$/) do
  visit root_path
end

When(/^I follow the link to facebook$/) do
  click_link "Share on Facebook"
end

Then(/^I should be able to spread the word on facebook\.$/) do
  page.should have_content "Share"
end

When(/^I follow the link to Tweet$/) do
  click_link "Tweet"
end

Then(/^I should be able to spread the word on twitter\.$/) do
    page.should have_content "Whats happening?"
end

When(/^I follow the link to Email$/) do
  click_link "Share by Email"
end

Then(/^I should be able to spread the word on via email\.$/) do
  page.should have_content "Welcome to Mail"
end
