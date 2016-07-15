require 'corelogic/objects/base.rb'

class CorelogicSearch < CorelogicBaseObject

  def self.match_address(client_name=nil, match_profile_id=nil, q)
    data = { clientName: client_name, matchProfileId: match_profile_id, q: q }
    init_get_request("#{Corelogic::Urls::SEARCH_BASE_URL}#{Corelogic::Urls::SEARCH_PATH}#{Corelogic::Urls::ADDRESS_MATCH_PATH}", data)
  end

  def self.find_by_address(client_name=nil, match_profile_id=nil, q)
    property = match_address(client_name, match_profile_id, q)
    puts property
    property_id = property["matchDetails"]["propertyId"]
    CorelogicProperty.detail(property_id)
  end
end