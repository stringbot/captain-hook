require 'rubygems'
require 'sinatra'
require 'json'
require 'yaml'
require 'haml'

require_relative 'lib/commit_receiver'

APP_CONFIG = YAML.load_file('config/config.yml')

# captain-hook only has one endpoint:
# GET   /         This will display the awesome
#                 home page for the project
#
# POST  /         This is where GitHub will send
#                 its post-receive hooks

get '/' do
  haml :index
end

# GitHub should send its post-receive hook to the site root
post '/' do
  # The data should include a payload and secret token
  unless params[:payload] && params[:token] && params[:token] == APP_CONFIG['token']
    throw :halt, [401, "Oops.\n"] and return
  else
    CommitReceiver.new(params[:payload])
    CommitReceiver.send_tweets
  end
end




