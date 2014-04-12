require 'spec_helper'

describe Route do  

  before(:each) do
    @user = mock_model("User")
    allow(User).to receive(:new).and_return(@user)
    allow(User).to receive(:find_by_remember_token).and_return(@user)
  end

  it 'should fail to create a route with a missing parameter' do
    expect(Route.create(endLocation: '123 Test St, Test, CA').valid?).to be(false)
  end

end
