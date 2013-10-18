When(/^I visit Read my story$/) do
  click_link "Read my story >"
end

Then(/^I should be able to read the candidtaes story$/) do
  page.should have_content "Mission Statement"
end
