require "spec_helper"

describe Auth do

  it "should retrieve auth token" do

    response = Auth.login('ochan', 'test')
    response.status.should be(200)
    response.body.should_not be_null
  end
end