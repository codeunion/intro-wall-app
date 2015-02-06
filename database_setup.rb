# Log DataMapper activity to the console
DataMapper::Logger.new(STDOUT, :debug)

# If we have a DATABASE_URL environment variable, use that.
# Otherwise, use a SQLite database named social-wall.db.
if ENV.key?("DATABASE_URL")
  DataMapper.setup(:default, ENV["DATABASE_URL"])
else
  DataMapper.setup(:default, "sqlite:social-wall.db")
end
