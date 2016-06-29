require 'corelogic/objects/base.rb'

class CorelogicSearch < CorelogicBaseObject

  def self.match_address(client_name=nil, match_profile_id=nil, q)
    data = { clientName: client_name, matchProfileId: match_profile_id, q: q }
    init_get_request("#{Urls::SEARCH_BASE_URL}#{Urls::SEARCH_PATH}#{Urls::ADDRESS_MATCH_PATH}", data)
  end
end