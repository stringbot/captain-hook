module CaptainHook
  module Authentication
    def valid_secret_key?(params)
      return false unless params[:secret_key]

      params[:secret_key] == ENV['SECRET_KEY']
    end
  end
end
