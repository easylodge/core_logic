require 'rails'

module Corelogic
  class Railtie < Rails::Railtie
    railtie_name :core_logic

    rake_tasks do
      load "tasks/corelogic.rake"
    end 
  end
end