module Superparser
  class Configuration
    attr_accessor :api_key, :async

    def initialize
      @api_key = nil
      @async = nil
    end
  end
end