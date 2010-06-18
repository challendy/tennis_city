# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tenniscity_session',
  :secret      => 'd329d52b405314b536b66cc57130a507c158efeca6ceecfa2c9c983d57d451756ad0a47e63be89a8c70448e89aae4df4b6124ad230332d2ac5f54b20544b299a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
