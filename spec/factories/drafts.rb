Factory.define :draft do |d|
  d.association :league
  d.number_of_teams 4
end