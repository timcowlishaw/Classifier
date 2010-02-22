# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_classifier_session',
  :secret => '7d0c7492c82e04f65a91622375cb84a6992396fbfaeae15f44f92b9332d9246d2da8c4160414dab42b23aa0b0b23914dc82a74ffe3a92a6cef6a2c45085a2c2f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
