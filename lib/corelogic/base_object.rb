module Corelogic
  class BaseObject

    def self.init_get_request(url, data = {})
      result = nil
      begin
        response = RestClient::Request.execute(method: :get, url: "#{url}",
                                               headers: { accept: :json, content_type: :json, params: data.except!(:credentials),
                                                          Authorization: "Bearer #{Corelogic::Authorization.token(data[:credentials])}" })
        result = JSON.parse(response.body)
        if(result['messages'])
          server_rescue(result['messages'].first)
        end
      rescue => e
        http_rescue(e)

      rescue JSON::ParserError => json_err
        json_rescue(json_err, response)

      rescue Corelogic::ServerError => e
        Corelogic::Utilities.server_error_handler(e)
      end
      return result
    end

    def self.init_post_request(url, data = {}, json=false )
      result = nil
      payload = data.except!(:credentials)
      begin
        headers = { Authorization: "Bearer #{Corelogic::Authorization.token(data[:credentials])}", params: json ? payload.to_json : payload }
        headers.merge!({ accept: :json, content_type: :json }) if json
        response = RestClient::Request.execute(method: :post, url: "#{url}", headers: headers)

        result = JSON.parse(response.body)
        if(result['messages'])
          server_rescue(result['messages'].first)
        end

      rescue => e
        http_rescue(e)

      rescue JSON::ParserError => json_err
        json_rescue(json_err, response)

      rescue Corelogic::ServerError => e
        Corelogic::Utilities.server_error_handler(e)
      end
      return result
    end

    def self.init_put_request(url, data = {} )
      result = nil
      begin
        response = RestClient::Request.execute(method: :put, url: "#{url}",
                                               headers: { Authorization: "Bearer #{Corelogic::Authorization.token(data[:credentials])}", params: data.except!(:credentials) })
        result = JSON.parse(response.body)
        if(result['messages'])
          server_rescue(result['messages'].first)
        end

      rescue => e
        http_rescue(e)

      rescue JSON::ParserError => json_err
        json_rescue(json_err, response)

      rescue Corelogic::ServerError => e
        Corelogic::Utilities.server_error_handler(e)
      end
      return result
    end

    def self.init_delete_request(url, data = {})
      result = nil
      begin
        response = RestClient::Request.execute(method: :delete, url: "#{url}",
                                               headers: { Authorization: "Bearer #{Corelogic::Authorization.token(data[:credentials])}" })
        result = JSON.parse(response.body)
        if(result['messages'])
          server_rescue(result['messages'].first)
        end

      rescue => e
        http_rescue(e)

      rescue JSON::ParserError => json_err
        json_rescue(json_err, response)

      rescue Corelogic::ServerError => e
        Corelogic::Utilities.server_error_handler(e)
      end
      return result
    end

    def self.server_rescue result
      raise Corelogic::ServerError.new(result), "Response code: #{result['code']}; Server Message: #{result['message']}; Type: #{result['type']}"
    end

    def self.http_rescue e
      raise Corelogic::ServerError.new(e), "HTTP Code #{e.response['code']}: #{e.response['message']}"
    end

    def self.json_rescue error, response
      raise Corelogic::ServerError.new(response) , "Invalid result data. Could not parse JSON response body \n #{error.message}"
    end
  end
end
