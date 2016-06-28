require 'corelogic/objects/base.rb'

class Authorization < CorelogicBaseObject

  def self.refresh_token

  end

  def self.get_token
    response = RestClient.get "#{Urls::BASE_URL}#{Urls::AUTH_PATH}", client_id:  Corelogic.new.client_id, client_secret: Corelogic.new.client_secret, grant_type: "client_credentials"
    session[:cl_access_token] = response["access_token"]
  end

  def self.token
    #check signature
    #check if expiry time has elapsed
    #If true, generate new token
  end
end