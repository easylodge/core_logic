require "spec_helper"

describe CorelogicProperty do

  it "should return a valid property object", type: :request do
    expect(CorelogicProperty.detail(12)).not_to be_nil
  end
end