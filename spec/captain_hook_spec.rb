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

  it "should accept the Heroku payload" do
    post '/', user: 'user@centro.test', app: 'The Transis', url: 'http://the-transis.herokuapp.com'
    last_response.should be_ok
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
