class TwitterPost
  def initialize(message)
    @message = message
    httpauth = Twitter::HTTPAuth.new(APP_CONFIG['twitter']['username'], APP_CONFIG['twitter']['password'])
    @client = Twitter::Base.new(httpauth)
  end
  
  def post
    @client.update(@message)
  end  
  
end