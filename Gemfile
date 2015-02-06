# This file contains information about which libraries
# our application needs in order to run.  In Ruby,
# these libraries are called "gems."
#
# Get it?  Ruby?  Gems?  Ha. ha. ha.

source("https://rubygems.org")  # Download our libraries from rubygems.org

gem("sinatra", "~> 1.4.5")      # Sinatra is the web framework we're using
gem("rack", "~> 1.5.2")         # This is required to fix a bug with Rack + Sinatra
gem("data_mapper")
gem("bcrypt")

# "development" refers to our local copy, running on our own computer
group("development") do
  gem("sqlite3")                # Use the SQLite3 database locally
  gem("dm-sqlite-adapter")      # Allow DataMapper to use SQLite3
  gem("rerun")
end

# "production" refers to a copy running on a remote server
# (Heroku in our case.)
group("production") do
  gem("dm-postgres-adapter")    # Heroku uses the PostgreSQL database
end
