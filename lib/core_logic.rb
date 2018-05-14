require 'rest-client'
require 'corelogic/errors'
require 'corelogic/railtie' if defined?(Rails)
require 'corelogic/utilities'
require 'corelogic/version'
require 'corelogic/urls'
require 'corelogic/authorization'
require 'corelogic/base'
require 'corelogic/credential'
require 'corelogic/property'
require 'corelogic/search'


class CoreLogic

  def initialize core_logic_client_id=nil, core_logic_client_secret=nil
    if core_logic_client_id.nil?
      @client_id = ENV['CORE_LOGIC_CLIENT_ID']
    else
      @client_id = core_logic_client_id
    end

    if core_logic_client_secret.nil?
      @client_secret = ENV['CORE_LOGIC_CLIENT_SECRET']
    else
      @client_secret = core_logic_client_secret
    end

    unless !@client_id.nil?
      raise CorelogicBadIdError, "No client_id supplied and couldn't find any in environment variables. Make sure to set client_id as an environment variable CORE_LOGIC_CLIENT_ID"
    end

    unless !@client_secret.nil?
      raise CorelogicBadSecretError, "No client_secret supplied and couldn't find any in environment variables. Make sure to set client_secret as an environment variable CORE_LOGIC_CLIENT_SECRET"
    end
  end


  def client_id
    @client_id
  end

  def client_secret
    @client_secret
  end

end
