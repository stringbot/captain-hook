require_relative 'hook'

module CaptainHook
  module Hooks
    instance_eval do
      def register_hooks(receiver)
        #receiver.add_hook(hipchat_hook)
        #receiver.add_hook(airbrake_hook)
      end

      def hipchat_hook
        #curl -d "auth_token=AUTHTOKEN&room_id=ROOM_ID&from=test_bot&message=hello%20world" http:/v1/rooms/message/
        ""
      end

      def airbrake_hook
        #curl -d "api_key=API_KEY&deploy[rails_env]=ENVIRONMENT" http://airbrake.io/deploys
        ""
      end

    end
  end
end
