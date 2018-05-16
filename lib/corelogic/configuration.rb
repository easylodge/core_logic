module Corelogic
  class Configuration
    attr_accessor :client_id, :client_secret

    def initialize(args = {})
      @client_id = args[:client_id] || ENV['CORE_LOGIC_CLIENT_ID']
      @client_secret = args[:client_secret] || ENV['CORE_LOGIC_CLIENT_SECRET']
    end
  end
end