# lib/generators/ruby_superparser/install_generator.rb

require 'rails/generators/base'

module RubySuperparser
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def create_initializer_file
      copy_file 'initializer.rb', 'config/initializers/ruby_superparser.rb'
    end
  end
end
