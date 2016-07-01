require "spec_helper"

describe CorelogicAuthorization do

  before(:each) do
    @obj = {
        access_token: "fdi38adsvljas839.a893azQ38700.839238asdnsidfaeZTY",
        token_type: "bearer",
        expires_in: 43199,
        scope: "CRT MAP PTY SGT STS TTL",
        iss: "RPData.oauth2",
        env_access_restrict: true
    }
    stub_request(:get, "#{Corelogic::Urls::AUTH_BASE_URL}?client_id=54cab2df&client_secret=2ac3762d90101478355827e052bd5403&grant_type=client_credentials").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby', 'Content-Type' => "application/json"}).
        to_return(:status => 200, :body => @obj.to_json, :headers => {})
  end

  context ".set_token" do
    it "should set up the access token" do
      expect(CorelogicAuthorization.set_token).to eq(@obj)
      expect(Corelogic::Credential.any?).to eq(true)
    end
  end

  context ".token" do
    it "should fetch the token" do
      expect(CorelogicAuthorization.token).to eq(JSON.parse(@obj.to_json)["access_token"])
    end
  end
end