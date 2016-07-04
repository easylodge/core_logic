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

  before(:each) do
    @address = "488 George Street, Sydney, NSW, 2000, Australia"
    authenticate
    find_match
  end

  it "returns the address of a property that" do
    expect(CorelogicSearch.match_address(@address)).not_to be_nil
    expect(CorelogicSearch.match_address(@address)).to eq(JSON.parse(@obj))
  end
end