module Corelogic
  module Urls
    BASE_URL = if Rails.env.production?
                 "https://property-api.corelogic.asia"
               else
                 "https://property-sandbox-api.corelogic.asia"
               end
    SEARCH_BASE_URL = if Rails.env.production?
                        "https://search-api.corelogic.asia"
                      else
                        "https://search-sandbox-api.corelogic.asia"
                      end
    AUTH_BASE_URL = "https://access-api.corelogic.asia/access/oauth/token"
    PROPERTY_PATH = "/bsg-au"
    POINT_SEARCH_PATH = "/v2/search/point"
    SEARCH_PATH = "/search"
    ADDRESS_MATCH_PATH = "/au/matcher/address"
  end
end
