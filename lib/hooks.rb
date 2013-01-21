module CaptainHook
  module Hooks
    instance_eval do
      def register_hooks(receiver)
        #receiver.add_hook(github_hook)
        #receiver.add_hook(airbrake_hook)
      end

      def github_hook
        ""
      end

      def airbrake_hook
        ""
      end
    end
  end
end
