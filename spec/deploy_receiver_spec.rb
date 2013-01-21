require 'spec_helper'

describe DeployReceiver do
  let(:url) { "http://example.com/posts" }
  let(:params) { { user: "Clyde Smelter", app: "test-app", url: "http://test-app.herokuapp.com" } }

  let(:receiver) do
    DeployReceiver.new.tap do |receiver|
      receiver.connection = MockConnection.new
    end
  end

  describe "receiving params from a POST" do
    let(:hook) { CaptainHook::Hook.new(url) { |params| { user: params[:user], app_name: params[:app] } } }
    let(:out_params) { { user: "Clyde Smelter", app_name: "test-app" } }

    before do
      receiver.add_hook(hook)
    end

    it "calls post with the parameters" do
      receiver.should_receive(:post).with(url, out_params)
      receiver.receive(params)
    end
  end

  describe "with no network connection configured" do
    it "still works fine" do
      expect { receiver.receive(params) }.to_not raise_error
    end
  end
end
