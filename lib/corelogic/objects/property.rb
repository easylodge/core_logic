require 'corelogic/objects/base.rb'

class CorelogicProperty < CorelogicBaseObject

  def self.detail(property_id)
    data = {
        returnFields: "site, title, address, attributes, legal, avmDetailList, contactList, currentOwnershipList, developmentApplicationList, externalReferenceList, featureList, forRentPropertyCampaignList, saleList, parcelList, forRentPropertyCampaignList, forSaleAgencyCampaignList"
    }
    init_get_request("#{Urls::PROPERTY_PATH}/v1/property#{property_id}.json", data )
  end

  def self.search_by_point(lon, lat)
    data = { lon: lon, lat: lat }
    init_get_request("#{Urls::PROPERTY_PATH}#{Urls::POINT_SEARCH_PATH}", data)
  end
end