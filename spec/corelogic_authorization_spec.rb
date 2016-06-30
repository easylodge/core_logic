require "spec_helper"

describe CorelogicAuthorization do
  it "should set up the access token" do
    expect(CorelogicAuthorization.set_token).not_to be_nil
  end

  it "should check expiry time if token exists" do

  end

  it "should return the token if it hasn't expired" do

  end

  it "should refresh the token if it has expired" do
    expect(CorelogicAuthorization.token).not_to be_nil
    expect(CorelogicAuthorization.token).to eq("xyz")
  end
end