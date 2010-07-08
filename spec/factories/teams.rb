Factory.define :team do |t|
  t.total_points 0
  t.wins 0
  t.losses 0
  t.last_weeks_points 0
end

Factory.define :valid_team, :parent => :team do |t|
  t.name "team_one"
  t.association :user, :factory => :valid_user
end

Factory.define :team_one, :parent => :team do |t|
  t.name "team_one"
  t.association :user, :factory => :user_one
end

Factory.define :team_two, :parent => :team do |t|
  t.name "team_two"
  t.association :user, :factory => :user_two
end

Factory.define :team_three, :parent => :team do |t|
  t.name "team_three"
  t.association :user, :factory => :user_three
end
