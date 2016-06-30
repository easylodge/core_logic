require 'rails_helper'

describe CoreLogic::Credential do

  context "attrs" do
    it { expect(subject).to respond_to :id } 
    it { expect(subject).to respond_to :access_token }
    it { expect(subject).to respond_to :expiry_time }
  end
end
