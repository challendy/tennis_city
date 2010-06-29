module LeaguesHelper
  def get_users
    users = User.find(:all).collect { |user| [user.email, user.id] }
  end
end
