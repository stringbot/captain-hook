require 'rubygems'
require 'sinatra'
require 'haml'

require_relative 'lib/authentication'
require_relative 'lib/deploy_receiver'

include CaptainHook::Authentication

# captain-hook only has one endpoint:
# GET   /         This will display the awesome
#                 home page for the project
#
# POST  /         This is where Heroku will send
#                 its post-deploy hooks

get '/' do
  haml :index
end

# Heroku should send its post-receive hook to the site root
post '/' do
  # The data should include params from a Heroku HTTP post hook
  unless params.length > 0 && valid_secret_key?(params)
    throw :halt, [401, "Oops.\n"] and return
  else
    logger.info "Received post with params: #{params}"
    DeployReceiver.new.receive(params)
  end
end




