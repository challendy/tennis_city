Factory.define :league do |l|
  l.name "test"
  l.length 10
  l.start_date "07-05-2010"
  l.end_date "11-13-2010"
  l.teams do |team| 
    [team.association(:team, :name => "one"), team.association(:team, :name => "two"), team.association(:team, :name => "three")]
  end
end