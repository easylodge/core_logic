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

  before(:each) do
    authenticate
    property_detail
  end

  context ".detail" do
    it "should return a valid property object", type: :request do
      expect(CorelogicProperty.detail(12)).not_to be_nil
      expect(CorelogicProperty.detail(12)).to eq(JSON.parse(@obj))
    end
  end

  context ".search_by_point" do

  end
end