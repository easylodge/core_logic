module Corelogic
  class ServerError < StandardError

    def initialize(response=nil)
      @response = response
    end

    attr_reader :response
  end

  class CorelogicBadIdError < StandardError
  end

  class CorelogicBadSecretError < StandardError
  end

end
