class DeployReceiver
  @@hooks = []

  def self.receive(params)
    @@hooks.each do |hook_url|
      @@driver.post hook_url, params
    end
  end

  def self.set_driver(driver)
    @@driver = driver
  end

  def self.add_hook(url)
    @@hooks << url
  end
end
