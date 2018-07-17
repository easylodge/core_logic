module Corelogic
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      
      source_root File.expand_path("../../templates", __FILE__)
      desc "Sets up the Corelogic configuration"

      def copy_config
        template ".env", "#{Rails.root}/.env"
        template "corelogic.rb", "config/initializers/corelogic.rb"
      end
    end
  end
end