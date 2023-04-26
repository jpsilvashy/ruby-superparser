# lib/generators/ruby_superparser/templates/superparser_job.rb

class SuperparserJob < ApplicationJob
  queue_as :default

  def perform(document_id)
    document = ExternalDocument.find(document_id)
    RubySuperparser.config.async.call(document)
  end
end
