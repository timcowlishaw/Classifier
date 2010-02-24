# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_classifier_session',
  :secret      => '3a486f2db20fe962e1bd1fb5f37e8a884f0021d8c0185bcb633b1d63e2961f3162ed5bee0d50c0aed56d9c6aaf926ff2f9194fef0d5141baa43f7b5efbd487f2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
