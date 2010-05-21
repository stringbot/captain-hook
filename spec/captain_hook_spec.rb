require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Captain Hook" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end
  
  
  
end