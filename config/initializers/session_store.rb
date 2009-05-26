# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mini_crm_session',
  :secret      => '55f482ca02c650d1a848e360c63760ad58ef4c95f45c613d0f44df04aa2d3f835ba060912d75e20b20c4535dbbd700e55734c18c79db5b9b9c344d159fb79a5b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
