# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_task1_session',
  :secret      => 'fdc6cf3ed77ceeeb25a1cf3fdcd91d48653faba5d0b5fda929a9d1bdacf41dd89b58baccf01a8a52d3429dc3b6e19855c494723d2040a8c3a2673469a1cf8996'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
