Factory.define :league do |l|
  l.name "test"
  l.length 10
  l.start_date "07-05-2010"
  l.end_date "11-13-2010"
  l.teams do |team| 
    [team.association(:team_one, :name => "one"), team.association(:team_two, :name => "two"), team.association(:team_three, :name => "three")]
  end
end