# lib/generators/ruby_superparser/templates/initializer.rb

RubySuperparser.init do |config|
  config.api_key = ENV['SUPERPARSER_API_KEY']

  config.async = lambda { |document_id|
    SuperparserJob.perform_later(document_id)
  }
end
