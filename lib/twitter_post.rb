class TwitterPost
  def initialize(message)
    @message = message
    httpauth = Twitter::HTTPAuth.new('USER_NAME_HERE', 'PASSWORD_HERE')
    @client = Twitter::Base.new(httpauth)
  end
  
  def post
    @client.update(@message)
  end  
  
end