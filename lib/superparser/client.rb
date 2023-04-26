# lib/superparser.rb

require 'net/http'
require 'net/http/post/multipart'

module Superparser
  class Client
    API_URL = 'https://api.superparser.com/parse'.freeze

    def initialize(config)
      @api_key = config.api_key
    end

    def parse(data_resource)
      uri = URI(API_URL)

      if data_resource.is_a?(ActiveStorage::Blob)
        file_data = StringIO.new(data_resource.download)
        file_name = 'resume.pdf'
      else
        file_data = StringIO.new(data_resource)
        file_name = 'resume.pdf'
      end

      request = Net::HTTP::Post::Multipart.new(uri.path,
        'file_name' => UploadIO.new(file_data, 'application/pdf', file_name)
      )

      request['X-API-Key'] = @api_key

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
