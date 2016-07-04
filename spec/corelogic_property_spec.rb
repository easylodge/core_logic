require "spec_helper"

describe CorelogicProperty do

  def authenticate
    @credentials =  File.read(File.expand_path("../../spec/support/fixtures/credentials.json", __FILE__))

    stub_request(:get, "#{Corelogic::Urls::AUTH_BASE_URL}?client_id=#{ENV['CORE_LOGIC_CLIENT_ID']}&client_secret=#{ENV['CORE_LOGIC_CLIENT_SECRET']}&grant_type=client_credentials").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => @credentials, :headers => {})
  end

  def property_detail
    @obj = File.read(File.expand_path("../../spec/support/fixtures/property.json", __FILE__))

    stub_request(:get, "https://property-sandbox-api.corelogic.asia/bsg-au/v1/property12.json?returnFields=site,%20title,%20address,%20attributes,%20legal,%20avmDetailList,%20contactList,%20currentOwnershipList,%20developmentApplicationList,%20externalReferenceList,%20featureList,%20forRentPropertyCampaignList,%20saleList,%20parcelList,%20forRentPropertyCampaignList,%20forSaleAgencyCampaignList").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer fdi38adsvljas839.a893azQ38700.839238asdnsidfaeZTY', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => @obj, :headers => {})
  end

  def property_search_by_point
    @result = File.read(File.expand_path("../../spec/support/fixtures/not_found.json", __FILE__))
    stub_request(:get, "https://property-sandbox-api.corelogic.asia/bsg-au/v2/search/point?lat=-33.9166&lon=151.2833").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer fdi38adsvljas839.a893azQ38700.839238asdnsidfaeZTY', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => @result, :headers => {})
  end


  context ".detail" do
    before(:each) do
      authenticate
      property_detail
    end

    it "should return a valid property object", type: :request do
      expect(CorelogicProperty.detail(12)).not_to be_nil
      expect(CorelogicProperty.detail(12)).to eq(JSON.parse(@obj))
    end
  end

  context ".search_by_point" do
    before(:each) do
      authenticate
      property_search_by_point
    end

    it "should return a valid property object for the location point", type: :request do
      expect(CorelogicProperty.search_by_point(151.28330, -33.91660)).not_to be_nil
      expect(CorelogicProperty.search_by_point(151.28330, -33.91660)).to eq(JSON.parse(@result))
    end
  end
end