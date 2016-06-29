class CorelogicBaseObject

  def initialize(core_logic_obj)
    unless !core_logic_obj.nil?
      raise ArgumentError, "Corelogic object cannot be nil!!"
    end
    @core_logic = core_logic_obj
  end

  attr_reader :core_logic

  protected

  def self.init_get_request(url, data = {})
    result = nil
    begin
      response =  RestClient.get "#{url}" , data,  :Authorization  => "Bearer #{CorelogicAuthorization.token}", :content_type => :json, :accept => :json
      unless (response.status == 200 || response.status == 201)
        http_rescue(response)
      end
      result = JSON.parse(response.body)
      unless(result['status'] != 0 )
        server_rescue(result)
      end

    rescue JSON::ParserError => json_err
      json_rescue(json_err, response)

    rescue CorelogicServerError => e
      Utilities.server_error_handler(e)
    end
    return result
  end

  def self.init_post_request(url, data = {}, json=false )
    result = nil
    begin
      if !json
        response =  RestClient.post "#{url}" , data,  :Authorization  => "Bearer #{CorelogicAuthorization.token}"
      else
        response =  RestClient.post "#{url}" , data.to_json,  :Authorization  => "Bearer #{CorelogicAuthorization.token}", :content_type => :json, :accept => :json

      end
      unless (response.status == 200 || response.status == 201)
        http_rescue(response)
      end
      result = JSON.parse(response.body)
      unless(result['status'] != 0 )
        server_rescue(result)
      end

    rescue JSON::ParserError => json_err
      json_rescue(json_err, response)

    rescue CorelogicServerError => e
      Utilities.server_error_handler(e)
    end
    return result
  end

  def self.init_put_request(url, data = {} )
    result = nil
    begin
      response =  RestClient.put "#{url}" , data,  :Authorization  => "Bearer #{CorelogicAuthorization.token}"
      unless (response.code == 200 || response.code == 201)
        http_rescue(response)
      end
      result = JSON.parse(response.body)
      if(result['messages'])
        server_rescue(result['messages'].first)
      end

    rescue JSON::ParserError => json_err
      json_rescue(json_err, response)

    rescue CorelogicServerError => e
      Utilities.server_error_handler(e)
    end
    return result
  end

  def self.init_delete_request(url)
    result = nil
    begin
      response =  RestClient.delete "#{url}" ,  :Authorization  => "Bearer #{CorelogicAuthorization.token}"
      unless (response.status == 200 || response.status == 201)
        http_rescue(response)
      end
      result = JSON.parse(response.body)
      unless(result['status'] != 0 )
        server_rescue(result)
      end

    rescue JSON::ParserError => json_err
      json_rescue(json_err, response)

    rescue CorelogicServerError => e
      Utilities.server_error_handler(e)
    end
    return result
  end

  def self.server_rescue result
    raise CorelogicServerError.new(result), "Response code: #{result['code']}; Server Message: #{result['message']}"
  end

  def self.http_rescue response
    raise CorelogicServerError.new(response), "HTTP Code #{response.code}: #{response.body}"
  end

  def self.json_rescue error, response
    raise CorelogicServerError.new(response) , "Invalid result data. Could not parse JSON response body \n #{error.message}"
  end
end
