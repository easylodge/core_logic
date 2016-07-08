require 'rails'

module Corelogic
  class Railtie < Rails::Railtie
    railtie_name :corelogic

    rake_tasks do
      load "tasks/corelogic.rake"
    end 
  end
end