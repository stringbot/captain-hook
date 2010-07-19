class TwitterPost
  def initialize(message)
    @message = message
    httpauth = Twitter::HTTPAuth.new('captainhook_rb', 'dr8FES7e')
    @client = Twitter::Base.new(httpauth)
  end
  
  def post
    @client.update(@message)
  end  
  
end