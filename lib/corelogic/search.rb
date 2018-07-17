module Corelogic
  class Search < BaseObject

    def self.match_address(q, credentials=[], client_name=nil, match_profile_id=nil)
      data = { clientName: client_name, matchProfileId: match_profile_id, q: q, credentials: credentials }
      init_get_request("#{Corelogic::Urls::SEARCH_BASE_URL}#{Corelogic::Urls::SEARCH_PATH}#{Corelogic::Urls::ADDRESS_MATCH_PATH}", data)
    end

    def self.find_by_address(q, credentials=[], client_name=nil, match_profile_id=nil)
      property = match_address(q, credentials, client_name, match_profile_id)
      property_id = property["matchDetails"]["propertyId"]
      Corelogic::Property.detail(property_id, credentials)
    end
  end

end
