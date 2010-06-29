When /^I fill in the league form$/ do
  params = { "league"=>{"name"=>"",
             "start_date"=>"",
             "teams_attributes"=>{"0"=>{"user_id"=>"1"}},
             "length"=>""}
            }
end
