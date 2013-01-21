module CaptainHook
  class Hook
    attr_reader :post_url

    def initialize(url, param_map)
      @post_url = url
      @param_map = param_map
    end

    def translate_params(in_params)
      in_params.inject({}) do |map,hash_pair|
        param, value        = hash_pair
        translated_key      = @param_map[param]

        map[translated_key] = value if translated_key
        map
      end
    end
  end
end
