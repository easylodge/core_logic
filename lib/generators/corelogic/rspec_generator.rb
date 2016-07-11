module Corelogic
  module Generators
    class RspecGenerator < Rails::Generators::Base
      
      source_root File.expand_path("../../templates", __FILE__)
      desc "Sets up the Core Logic Rspec files"

      def copy_rspec
        template "corelogic_spec.rb", "spec/models/corelogic_spec.rb"
      end
    
    end
  end
end