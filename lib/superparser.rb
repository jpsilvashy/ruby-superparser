# lib/superparser.rb

require "superparser/version"
require "superparser/configuration"
require "superparser/client"
# require "superparser/superparser_integration"

module Superparser
  class Error < StandardError; end

  def self.init
    @config = Configuration.new
    yield @config if block_given?
  end

  def self.config
    @config
  end
end

# Include the SuperparserIntegration module in ActiveRecord::Base
# ActiveSupport.on_load(:active_record) do
#   include Superparser::SuperparserIntegration
# end

