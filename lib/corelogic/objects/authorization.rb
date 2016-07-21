require 'corelogic/objects/base.rb'

class CorelogicAuthorization < CorelogicBaseObject

  def self.set_token
    Corelogic::Credential.delete_all
    response =  RestClient::Request.execute(method: :get, url: "#{Corelogic::Urls::AUTH_BASE_URL}",
                                headers: { accept: "*/*", params: { client_id:  CoreLogic.new.client_id,
                                                                    client_secret: CoreLogic.new.client_secret,
                                                                    grant_type: "client_credentials"
                                }}
    )
    result = JSON.parse(response.body)

    if(result['messages'])
      server_rescue(result['messages'].first)
    end

    token = Corelogic::Credential.create!(access_token: result["access_token"], expiry_time: Time.now + result["expires_in"])
    token.access_token

  rescue JSON::ParserError => json_err
    json_rescue(json_err, response)
  end

  def self.token
    credential = Corelogic::Credential.first
    (credential && (Time.now <= credential.expiry_time)) ? credential.access_token : set_token
  end
end