# lib/ruby_superparser.rb

require 'net/http'
require 'net/http/post/multipart'

module RubySuperparser
  class Client
    API_URL = 'https://api.superparser.com/parse'.freeze

    def initialize(api_key)
      @api_key = api_key
    end

    def parse_resume(file_path)
      uri = URI(API_URL)

      request = Net::HTTP::Post::Multipart.new(uri.path,
        'file_name' => UploadIO.new(File.open(file_path), 'application/pdf')
      )
      request['accept'] = 'application/json'
      request['X-API-Key'] = @api_key
      request['Content-Type'] = 'multipart/form-data'

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      response = http.request(request)

      if response.is_a?(Net::HTTPSuccess)
        puts 'Successfully parsed the document'
        return response.body
      else
        puts 'Failed to parse the document'
        return nil
      end
    end
  end
end
