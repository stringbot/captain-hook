require 'spec_helper'

$payload = File.open("spec/data/payload.json", "r") do |line|
  line.gets
end

$with_post = File.open("spec/data/with_post.json", "r") do |line|
  line.gets
end

describe "Commit Receiver" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end
  
  it "should receive the GitHub payload" do
    post '/', :payload => $payload
    last_response.should be_ok
  end
  
  it "should parse the JSON" do
    CommitReceiver.new($payload)
    @payload.is_a?(Hash) == true
  end
  
  it "should add 'NEW POST' messages to queue" do
    CommitReceiver.new($with_post)
    $new_posts.empty? == false
  end
  
  it "should ignore commits that aren't a blog post" do
    CommitReceiver.new($with_post)
    $new_posts.empty? == true
  end
  
end