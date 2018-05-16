require "spec_helper"

describe Corelogic::Authorization do

  before(:each) do
    @obj = File.read(File.expand_path("../../spec/support/fixtures/credentials.json", __FILE__))
    stub_request(:get, "#{Corelogic::Urls::AUTH_BASE_URL}?client_id=#{ENV['CORE_LOGIC_CLIENT_ID']}&client_secret=#{ENV['CORE_LOGIC_CLIENT_SECRET']}&grant_type=client_credentials").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => @obj, :headers => {})
  end

  context ".set_token" do
    it "should set up the access token" do
      expect(Corelogic::Authorization.set_token).to eq(Corelogic::Credential.first.access_token)
    end
  end

  context ".token" do
    it "should fetch the token" do
      expect(Corelogic::Authorization.token).to eq(JSON.parse(@obj)["access_token"])
    end
  end
end