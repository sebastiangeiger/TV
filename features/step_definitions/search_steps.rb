When(/^I enter "(.*?)" into the search form$/) do |query|
  find("input#search-query").set(query)
end

Then(/^I should see "(.*?)" in the auto\-complete list$/) do |name|
  page.should have_content name
end

