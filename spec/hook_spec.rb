require 'spec_helper'
require_relative '../lib/hook'

describe CaptainHook::Hook do
  let(:param_map) { { :param_1 => :translated_1, :param_2 => :translated_2 } }
  let(:hook) { CaptainHook::Hook.new("http://post-url.test", param_map) }
  let(:example_params) { { :param_1 => "one", :param_2 => "two" } }
  let(:expected_params) { { :translated_1 => "one", :translated_2 => "two" } }

  it "translates params" do
    hook.translate_params(example_params).should == expected_params
  end

  it "knows the post url" do
    hook.post_url.should == "http://post-url.test"
  end
end
