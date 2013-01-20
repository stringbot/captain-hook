require 'spec_helper'

describe "Captain-Hook" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  before do
    ENV['SECRET_KEY'] = 'abc123'
  end

  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end

  it "should accept the Heroku payload" do
    post '/', user: 'user@centro.test', app: 'The Transis', secret_key: 'abc123'
    last_response.should be_ok
  end

  describe "without the secret-key parameter" do
    it "should return a 401 error" do
      post '/', user: 'user@centro.test', app: 'The Transis'
      last_response.status.should == 401
    end
  end

  describe "without any POST parameters" do
    it "should return a 401 error" do
      post '/'
      last_response.status.should == 401
    end
  end

  describe "with a new deploy" do
    before { @cr = DeployReceiver.new([]) }

    it "should POST to hipchat"

    it "should POST to airbrake"

  end

end
