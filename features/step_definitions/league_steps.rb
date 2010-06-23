Given /^the following create_leagues:$/ do |create_leagues|
  CreateLeague.create!(create_leagues.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) create_league$/ do |pos|
  visit create_leagues_url
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following create_leagues:$/ do |expected_create_leagues_table|
  expected_create_leagues_table.diff!(tableish('table tr', 'td,th'))
end
