class CorelogicBaseObject

  def self.init_get_request(url, data = {})
    result = nil
    begin
      response = RestClient::Request.execute(method: :get, url: "#{url}",
                                  headers: { accept: :json,
                                             content_type: :json,
                                             Authorization: "Bearer #{CorelogicAuthorization.token}",
                                             params: data
                                  }
      )
      result = JSON.parse(response.body)
      if(result['messages'])
        server_rescue(result['messages'].first)
      end
    rescue => e
      http_rescue(e)

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
        response = RestClient::Request.execute(method: :post, url: "#{url}",
                                               headers: {
                                                   Authorization: "Bearer #{CorelogicAuthorization.token}",
                                                   params: data
                                               }
        )
      else
        response = RestClient::Request.execute(method: :post, url: "#{url}",
                                               headers: { accept: :json,
                                                          content_type: :json,
                                                          Authorization: "Bearer #{CorelogicAuthorization.token}",
                                                          params: data.to_json
                                               }
        )
      end
      result = JSON.parse(response.body)
      if(result['messages'])
        server_rescue(result['messages'].first)
      end

    rescue => e
      http_rescue(e)

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
      response = RestClient::Request.execute(method: :put, url: "#{url}",
                                             headers: {
                                                 Authorization: "Bearer #{CorelogicAuthorization.token}",
                                                 params: data
                                             }
      )
      result = JSON.parse(response.body)
      if(result['messages'])
        server_rescue(result['messages'].first)
      end

    rescue => e
      http_rescue(e)

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
      response = RestClient::Request.execute(method: :delete, url: "#{url}",
                                             headers: {
                                                 Authorization: "Bearer #{CorelogicAuthorization.token}"
                                             }
      )
      result = JSON.parse(response.body)
      if(result['messages'])
        server_rescue(result['messages'].first)
      end

    rescue => e
      http_rescue(e)

    rescue JSON::ParserError => json_err
      json_rescue(json_err, response)

    rescue CorelogicServerError => e
      Utilities.server_error_handler(e)
    end
    return result
  end

  def self.server_rescue result
    render :json => "Response code: #{result['code']}; Server Message: #{result['message']}; Type: #{result['type']}"
  end

  def self.http_rescue e
    render :json => "HTTP Code #{e.response.code}: #{e.response.message}"
  end

  def self.json_rescue error, response
    raise CorelogicServerError.new(response) , "Invalid result data. Could not parse JSON response body \n #{error.message}"
  end
end
