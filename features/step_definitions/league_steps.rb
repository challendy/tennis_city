When /^I fill in the league form and submit$/ do
    within("//form[@id='new_league']") do
      fill_in 'Name', :with => 'Test league'
      fill_in 'Length', :with => '10'
      fill_in 'Start_date', :with => '07-04-2010'      
    end
    click_link 'Create'  
end