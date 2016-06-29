require 'corelogic/objects/base.rb'

class Authorization < CorelogicBaseObject

  def self.set_token
    response = RestClient.get "#{Urls::BASE_URL}#{Urls::AUTH_PATH}", client_id:  Corelogic.new.client_id, client_secret: Corelogic.new.client_secret, grant_type: "client_credentials"
    cookies[:cl_access_token] = { value: response["access_token"], expires: Time.now + response["expires_in"] }
    cookies[:cl_access_token]
  end

  def self.token
    cookies[:cl_access_token] || set_token
  end
end