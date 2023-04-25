# lib/generators/ruby_superparser/templates/initializer.rb

api_key = ENV['SUPERPARSER_API_KEY']
SUPERPARSER_CLIENT = RubySuperparser::Client.new(api_key)
