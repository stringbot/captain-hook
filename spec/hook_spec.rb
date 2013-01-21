require 'spec_helper'

describe CaptainHook::Hook do
  let(:hook) do
    CaptainHook::Hook.new("http://api.hipchat.test/fake_endpoint") do |deploy_keys|
      {
        auth_token: "faketoken",
        room_id: "room name",
        from: "deploy bot",
        message: "#{deploy_keys[:head]} deployed by #{deploy_keys[:user]}"
      }
    end
  end

  #heroku hook vars
  #app: the app name
  #user: email of the user deploying the app
  #url: the app URL (http://myapp.heroku.com or http://mydomain.com if you have custom domains enabled)
  #head: short identifier of the latest commit (first seven bytes of the SHA1 git object name)
  #head_long: full identifier of the latest commit
  #git_log: log of commits between this deploy and the last

  describe "building params" do
    let(:deploy_params) { { app: "fake-app", user: "user@fake.test", url: "http://app-url.com", head: "DEADBEEF" } }
    let(:hipchat_params) { { auth_token: "faketoken", room_id: "room name", from: "deploy bot", message: "DEADBEEF deployed by user@fake.test" } }

    it "builds valid hipchat params" do
      hook.translate_params(deploy_params).should == hipchat_params
    end

  end
end
