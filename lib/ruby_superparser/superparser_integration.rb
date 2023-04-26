# lib/ruby_superparser/superparser_integration.rb

module RubySuperparser
  module SuperparserIntegration
    extend ActiveSupport::Concern

    class_methods do
      def superparser_for_attached(attached_attribute, options = {})
        after_save :process_document_with_superparser, if: "saved_change_to_attribute?(:#{attached_attribute})"
        
        define_method :process_document_with_superparser do
          if options[:async]
            RubySuperparser.config.async.call(id)
          else
            superparser_client.parse_resume(send(attached_attribute))
          end
        end
      end
    end

    private

    def superparser_client
      @superparser_client ||= RubySuperparser::Client.new(RubySuperparser.config)
    end

  end
end

