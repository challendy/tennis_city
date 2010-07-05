# load app_config.yml
require 'yaml'
APP_CONFIG = YAML.load(File.read(RAILS_ROOT + "/config/initializers/app_config.yml"))