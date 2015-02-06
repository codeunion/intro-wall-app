## Load Required Gems
require "sinatra"     # The Sinatra web framework
require "data_mapper" # The DataMapper database library

## Configure Database Connection
require "./database_setup"

## Configure Sinatra
# See http://www.sinatrarb.com/configuration.html#built-in-settings

# Sinatra will serve up any files in the public folder without
# processing them.  This is where we want to place any static
# files (e.g., CSS, JavaScript, static images, etc.).
set(:public_folder, File.join(Sinatra::Application.root(), "public"))

# Sinatra will look for view templates in the directory specificed here.
set(:views, File.join(Sinatra::Application.root(), "views"))

## Define DataMapper Database Models
class Message
  include DataMapper::Resource

  property :id,         Serial, { :required => true }
  property :body,       Text,   { :required => true }
  property :created_at, Time,   { :required => true }
end

## Finalize DataMapper Setup

# "finalize" tells DataMapper we're done adding models
DataMapper.finalize()

# "auto_upgrade!" alters our database as needed to
# make it work with the models we've defined
DataMapper.auto_upgrade!()

## The Web Application

# "Helpers" are small, single-purpose methods available in our
# view templates. They are typically used to encapsulate formatting
# or display logic. See http://www.sinatrarb.com/intro.html#Helpers.
helpers do
  def format_timestamp(timestamp)
    # See http://www.ruby-doc.org/core-2.1.5/Time.html#method-i-strftime
    timestamp.strftime("%B %d, %Y at %l:%M%p")
  end
end

## Define Routes / Endpoints

# "/" is called the "root URL" or "index URL"
get("/") do
  records   = Message.all({ :order => :created_at.desc })
  view_data = { :messages => records }

  erb(:index, { :locals => view_data })
end

# Create a new Message
# We use the <form> tag in `views/index.erb` to send data
# to this endpoint.
post("/messages") do
  message_body = params["body"]
  message_time = Time.now
  message_data = { :body => message_body, :created_at => message_time }

  message = Message.create(message_data)

  if message.saved?
    redirect("/")
  else
    erb(:error, { :locals => { :message => message } })
  end
end
