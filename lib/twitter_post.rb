class TwitterPost
  def initialize(message)
    # Append blog url to the message
    @message = "#{message} " + APP_CONFIG['blog']['url']

    httpauth = Twitter::HTTPAuth.new(
      APP_CONFIG['twitter']['username'],
      APP_CONFIG['twitter']['password']
    )
    @client = Twitter::Base.new(httpauth)
  end
  
  def post
    @client.update(@message)
  end
  
end
