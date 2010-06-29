Factory.define :valid_user, :class => :user do |u|
  u.email "valid_user@gmail.com"
  u.password "valid_user"
end

Factory.define :user_one, :class => :user do |u|
  u.email "user1@gmail.com"
  u.password "test12"
end

Factory.define :user_two, :class => :user do |u|
  u.email "user2@gmail.com"
  u.password "test12"
end

Factory.define :user_three, :class => :user do |u|
  u.email "user3@gmail.com"
  u.password "test12"
end