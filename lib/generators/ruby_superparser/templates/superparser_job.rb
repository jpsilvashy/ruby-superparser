# lib/generators/superparser/templates/superparser_job.rb

class SuperparserJob < ApplicationJob
  queue_as :default

  def perform(document_id)
  end
end
