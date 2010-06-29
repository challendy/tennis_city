RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'warden'
  config.gem 'devise', :version => '1.0.7'
  config.gem "rubyist-aasm", :source => "http://gems.github.com", :lib => false
  config.gem "haml", :version => ">3.0.4"
  config.time_zone = 'UTC'
end