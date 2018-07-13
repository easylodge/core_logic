require 'corelogic/base_object'

module Corelogic
  class Authorization

    def self.token
      response =  RestClient::Request.execute(method: :get, url: "#{Corelogic::Urls::AUTH_BASE_URL}",
                                              headers: { accept: "*/*", params: { client_id:  self.configuration.client_id,
                                                                                  client_secret: self.configuration.client_secret,
                                                                                  grant_type: "client_credentials"
                                              }}
      )
      result = JSON.parse(response.body)

      if(result['messages'])
        server_rescue(result['messages'].first)
      end

      result["access_token"]

    rescue JSON::ParserError => json_err
      json_rescue(json_err, response)
    end
  end
end
