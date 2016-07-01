require "spec_helper"

describe CorelogicProperty do

  before(:each) do
    stub_request(:get, "#{Corelogic::Urls::AUTH_BASE_URL}?client_id=54cab2df&client_secret=2ac3762d90101478355827e052bd5403&grant_type=client_credentials").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})

  end

  it "should return a valid property object", type: :request do
    expect(CorelogicProperty.detail(12)).not_to be_nil
  end
end