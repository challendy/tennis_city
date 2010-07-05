namespace :db do
  desc "weekly processor of players points and team standings"
  task :league_processor  => :environment do
    app = LeagueProcessor.new
    app.run
  end
end
   