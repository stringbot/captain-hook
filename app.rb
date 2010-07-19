require 'rubygems'
require 'sinatra'
require 'json'
require 'twitter'

require 'lib/commit_receiver'
require 'lib/twitter_post'

APP_CONFIG = YAML.load_file('config/config.yml')

# captain-hook only has one endpoint:
# GET   /         This will display the awesome
#                 home page for the project
#
# POST  /         This is where GitHub will send
#                 its post-receive hooks

get '/' do
  erb :index
end

# GitHub should send its post-receive hook to the site root
post '/' do
  CommitReceiver.new(params[:payload])
  CommitReceiver.send_tweets
end




