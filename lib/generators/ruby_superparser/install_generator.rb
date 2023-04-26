# lib/generators/superparser/install_generator.rb

require 'rails/generators/base'

module Superparser
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def create_initializer_file
      copy_file 'initializer.rb', 'config/initializers/superparser.rb'
    end
  end
end
