module Corelogic
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      
      source_root File.expand_path("../../templates", __FILE__)
      desc "Sets up the Core Logic env variables File"

      def copy_config
        template ".env", "#{Rails.root}/.env"
      end

      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.new.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end
      
      def create_migration_file
        migration_template "migration_corelogic_credentials.rb", "db/migrate/create_corelogic_credentials.rb"
      end
    end
  end
end