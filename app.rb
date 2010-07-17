require 'rubygems'
require 'json'
require 'sinatra'

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
  CaptainHook.new(params[:payload])
end

class CaptainHook
  def initialize(payload)
    payload = JSON.parse(payload)
    return unless payload["repository"]["owner"]["name"] == "mattonrails"

    payload["commits"].each do |commit|
      process_commit(commit["message"])
    end
  end

  def process_commit(message)
    @new_posts = []

    if message =~ /NEW POST/
      @new_posts << message
    end
  end

end
