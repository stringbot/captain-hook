require_relative 'hook'

module CaptainHook
  module Hooks
    instance_eval do
      def register_hooks(receiver)
        receiver.add_hook(hipchat_hook)
        #receiver.add_hook(airbrake_hook)
      end

      # TODO: Modularize this better
      def hipchat_hook
        #curl -d "auth_token=AUTHTOKEN&room_id=ROOM_ID&from=test_bot&message=hello%20world" http:/v1/rooms/message/
        base_params = {
          auth_token: ENV['HIPCHAT_API_KEY'],
          room_id:    ENV['HIPCHAT_ROOM_ID'],
          from:       "Deploy Bot"
        }

        CaptainHook::Hook.new("http://api.hipchat.com/v1/rooms/message/") do |deploy_params|
          base_params.merge({
            message: "#{deploy_params[:user]} deployed #{deploy_params[:head]} to #{deploy_params[:url]}"
          })
        end
      end

      def airbrake_hook
        base_params = {
          'api_key' => ENV['AIRBRAKE_API_KEY'],
          'deploy[rails_env]' => ENV['AIRBRAKE_DEPLOY_ENV']
        }

        CaptainHook::Hook.new("http://airbrake.io/deploys") do |deploy_params|
          base_params.merge({
            'deploy[local_username]' => deploy_params[:user],
            'deploy[scm_revision'    => deploy_params[:head]
          })
        end
      end

    end
  end
end
