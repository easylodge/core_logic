require 'paystack/errors.rb'

class Utilities

    def self.server_error_handler(e)

    if(e.response == nil)
      raise e
      return
    end
    error = CorelogicServerError.new(e.response);
    case e.response.code
      when 400
        raise error, "HTTP Code 400: Bad Request. "
      when 401
        raise error, "HTTP Code 401: Unauthorized! "
      when 404
        raise error, "HTTP Code 404: Not Found!"
      when 500, 501,502,503,504
        raise error, "HTTP Code #{e.response.code}: Request could not be fulfilled due to an error on Core Logic's end. This shouldn't happen so please report as soon as you encounter any instance of this."
      else
        raise error, "HTTP Code #{e.response.code}: #{e.response.body}"

    end

  end

end
