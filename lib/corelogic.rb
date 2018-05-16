require 'rest-client'
require 'corelogic/errors'
require 'corelogic/railtie' if defined?(Rails)
require 'corelogic/utilities'
require 'corelogic/version'
require 'corelogic/urls'
require 'corelogic/configuration'
require 'corelogic/authorization'
require 'corelogic/base_object'
require 'corelogic/property'
require 'corelogic/search'


module Corelogic
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
