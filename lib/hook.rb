module CaptainHook
  class Hook
    attr_reader :post_url

    def initialize(url, &block)
      @post_url = url
      @translator_proc = block
    end

    def translate_params(in_params)
      @translator_proc.call(in_params)
    end
  end
end
