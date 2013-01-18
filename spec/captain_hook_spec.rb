require 'spec_helper'

describe "Captain-Hook" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end

  it "should accept the Heroku payload"
    #APP_CONFIG['token'] = 'secret'
    #post '/', :payload => PayloadWithoutPosts, :token => 'secret'
    #last_response.should be_ok

  describe "without any POST parameters" do
    it "should return a 401 error" do
      post '/'
      last_response.status.should == 401
    end

  end

  describe "without any new posts" do
    before { @cr = CommitReceiver.new(PayloadWithoutPosts) }

    it "should parse the JSON" do
      @payload.is_a?(Hash) == true
    end
  end

  describe "with new post(s)" do
    before { @cr = CommitReceiver.new(PayloadWithPost) }

    #it "should add 'NEW POST' messages to queue" do
      #$new_posts.empty? == false
    #end

    it "should POST to hipchat"

    it "should POST to airbrake"

  end

end
