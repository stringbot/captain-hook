require 'spec_helper'

#quacks like Faraday
class MockConnection
  def post(&block)
  end
end

describe DeployReceiver do
  let(:url) { "http://example.com/posts" }
  let(:params) { { user: "Clyde Smelter", app: "test-app", url: "http://test-app.herokuapp.com" } }

  let(:receiver) do
    DeployReceiver.new.tap do |receiver|
      receiver.connection = MockConnection.new
    end
  end

  describe "receiving params from a POST" do
    before do
      receiver.add_hook(url)
    end

    it "calls post with the parameters" do
      receiver.should_receive(:post).with(url, params)
      receiver.receive(params)
    end
  end

  describe "with no network connection configured" do
    it "still works fine" do
      expect { receiver.receive(params) }.to_not raise_error
    end
  end
end
