# lib/ruby_superparser.rb

require_relative 'ruby/superparser/version'
require_relative 'ruby_superparser/client'
require_relative 'ruby_superparser/configuration'
require_relative 'ruby_superparser/superparser_integration'

module RubySuperparser
  def self.config
    @config ||= Configuration.new
  end

  def self.init
    yield config if block_given?
  end
end