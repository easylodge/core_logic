require "spec_helper"

describe CorelogicSearch do

  def authenticate
    @credentials = File.read(File.expand_path("../../spec/support/fixtures/credentials.json", __FILE__))

    stub_request(:get, "#{Corelogic::Urls::AUTH_BASE_URL}?client_id=#{ENV['CORE_LOGIC_CLIENT_ID']}&client_secret=#{ENV['CORE_LOGIC_CLIENT_SECRET']}&grant_type=client_credentials").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => @credentials, :headers => {})
  end

  def find_match
    @obj = File.read(File.expand_path("../../spec/support/fixtures/match_data.json", __FILE__))

    stub_request(:get, "https://search-sandbox-api.corelogic.asia/search/au/matcher/address?clientName=&matchProfileId=&q=488%20George%20Street,%20Sydney,%20NSW,%202000,%20Australia").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer fdi38adsvljas839.a893azQ38700.839238asdnsidfaeZTY', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => @obj, :headers => {})
  end

  def find_property_details
    @obj = File.read(File.expand_path("../../spec/support/fixtures/match_data.json", __FILE__))
    @property = File.read(File.expand_path("../../spec/support/fixtures/property.json", __FILE__))
    stub_request(:get, "https://search-sandbox-api.corelogic.asia/search/au/matcher/address?clientName=&matchProfileId=&q=488%20George%20Street,%20Sydney,%20NSW,%202000,%20Australia").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer fdi38adsvljas839.a893azQ38700.839238asdnsidfaeZTY', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => @obj, :headers => {})
    stub_request(:get, "https://property-sandbox-api.corelogic.asia/bsg-au/v1/property17158755.json?returnFields=site,%20title,%20address,%20attributes,%20legal,%20avmDetailList,%20contactList,%20currentOwnershipList,%20developmentApplicationList,%20externalReferenceList,%20featureList,%20forRentPropertyCampaignList,%20saleList,%20parcelList,%20forRentPropertyCampaignList,%20forSaleAgencyCampaignList").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer fdi38adsvljas839.a893azQ38700.839238asdnsidfaeZTY', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => @property, :headers => {})
  end

  before(:each) do
    @address = "488 George Street, Sydney, NSW, 2000, Australia"
    authenticate
  end

  context ".match_address" do
    before do
      find_match
    end

    it "returns the id of a property that matches the address passed in" do
      expect(CorelogicSearch.match_address(@address)).not_to be_nil
      expect(CorelogicSearch.match_address(@address)).to eq(JSON.parse(@obj))
    end
  end

  context ".find_by_address" do
    before do
      find_property_details
    end

    it "returns the details of a property that matches the address passed in" do
      expect(CorelogicSearch.find_by_address(@address)).not_to be_nil
      expect(CorelogicSearch.find_by_address(@address)).to eq(JSON.parse(@property))
    end
  end

end