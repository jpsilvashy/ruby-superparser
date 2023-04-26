# lib/superparser/superparser_integration.rb

module Superparser
  module SuperparserIntegration
    extend ActiveSupport::Concern

    class_methods do
      def superparser_for_attached(attached_attribute, options = {})
        @attached_attribute = attached_attribute
        after_save :process_document_with_superparser, if: -> { saved_change_to_attribute?(@attached_attribute) }

        define_method :process_document_with_superparser do
          if options[:async]
            Superparser.config.async.call(id)
          else
            superparser_client.parse(send(attached_attribute))
          end
        end
      end
    end

    private

    def superparser_client
      @superparser_client ||= Superparser::Client.new(Superparser.config)
    end

  end
end

