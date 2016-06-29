require 'corelogic/objects/base.rb'

class CorelogicProperty < CorelogicBaseObject

  def self.detail(property_id)
    data = {
        returnFields: "site, title, address, attributes, legal, avmDetailList, contactList, currentOwnershipList, developmentApplicationList, externalReferenceList, featureList, forRentPropertyCampaignList, saleList, parcelList, forRentPropertyCampaignList, forSaleAgencyCampaignList"
    }
    init_get_request("#{Urls::BASE_URL}#{Urls::PROPERTY_PATH}/v1/property#{property_id}.json", data )
  end

  def self.search_by_point(longitude, latitude)
    data = { lon: longitude, lat: latitude }
    init_get_request("#{Urls::BASE_URL}#{Urls::PROPERTY_PATH}#{Urls::POINT_SEARCH_PATH}", data)
  end
end