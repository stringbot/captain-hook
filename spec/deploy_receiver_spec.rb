require 'spec_helper'

describe DeployReceiver do
  describe "receiving params from a POST" do
    let(:url) { "http://example.com/posts" }
    let(:params) { { user: "Clyde Smelter", app: "test-app", url: "http://test-app.herokuapp.com" } }
    let(:test_driver) do
      double("TestDriver")
    end

    before do
      DeployReceiver.set_driver(test_driver)
      DeployReceiver.add_hook(url)
    end

    it "calls TestDriver.post with the parameters" do
      test_driver.should_receive(:post).with(url, params)
      DeployReceiver.receive(params)
    end
  end
end
