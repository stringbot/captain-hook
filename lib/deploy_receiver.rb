require 'faraday'

class DeployReceiver
  attr_accessor :connection

  def initialize
    load_hooks
    @connection = faraday_connection
  end

  def receive(params)
    @hooks.each do |hook|
      post hook.post_url, hook.translate_params(params)
    end
  end

  def add_hook(url)
    @hooks << url
  end

  def post(url, params)
    @connection.post do |request|
      request.url url
      request.params = params
    end
  end

  private

  def faraday_connection
    @connection ||= Faraday.new() do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def load_hooks
    @hooks = []
    CaptainHook::Hooks.register_hooks(self)
  end
end
