# lib/generators/superparser/templates/initializer.rb

Superparser.init do |config|
  config.api_key = ENV['SUPERPARSER_API_KEY']

  config.async = lambda { |document_id|
    SuperparserJob.perform_later(document_id)
  }
end
