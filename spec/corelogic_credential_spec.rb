require "spec_helper"

describe Corelogic::Credential do
  context "attrs" do
    it { expect(subject).to respond_to :access_token }
    it { expect(subject).to respond_to :expiry_time }
  end
end