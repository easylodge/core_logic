require 'corelogic/objects/base.rb'

class CorelogicProperty < CorelogicBaseObject

  def self.detail(property_id)
    data = {
        returnFields: "site, title, address, attributes, legal, avmDetailList, contactList, currentOwnershipList, developmentApplicationList, externalReferenceList, featureList, forRentPropertyCampaignList, saleList, parcelList, forRentPropertyCampaignList, forSaleAgencyCampaignList"
    }
    init_get_request("#{Urls::PROPERTY_BASE_URL}/v1/property#{property_id}.json", data )
  end
end