require 'corelogic/objects/base.rb'

class CorelogicProperty < CorelogicBaseObject

  def self.detail(property_id)
    data = {
        returnFields: "site, title, address, attributes, legal, avmDetailList, contactList, propertyPhotoList, currentOwnershipList, developmentApplicationList, externalReferenceList, featureList, forRentPropertyCampaignList, saleList, parcelList, forRentPropertyCampaignList, forSaleAgencyCampaignList"
    }
    init_get_request("#{Corelogic::Urls::BASE_URL}#{Corelogic::Urls::PROPERTY_PATH}/v1/property/#{property_id}.json", data )
  end

  def self.search_by_point(longitude, latitude)
    data = { lon: longitude, lat: latitude }
    init_get_request("#{Corelogic::Urls::BASE_URL}#{Corelogic::Urls::PROPERTY_PATH}#{Corelogic::Urls::POINT_SEARCH_PATH}", data)
  end

  def self.profile_pdf(params={})
    data = { propertyProfileInputParams: params }
    init_post_request("#{Corelogic::Urls::BASE_URL}#{Corelogic::Urls::PROPERTY_PATH}/v1/profile/property.pdf", data )
  end

  def self.suggestion_service(q, limit=nil, include_units=nil, include_body_corporates=nil, return_suggestion=nil)
    data = {suggestionTypes: "address, street, locality, postcode, territorialAuthority, councilArea, state, country",
            q: q, limit: limit, includeUnits: include_units, includeBodyCorporates: include_body_corporates, returnSuggestion: return_suggestion}
    init_get_request("#{Corelogic::Urls::BASE_URL}#{Corelogic::Urls::PROPERTY_PATH}/v1/suggest.json", data)
  end
end
