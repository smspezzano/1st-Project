require 'spec_helper'

describe User do  

  it "should fail with an invalid email" do
    expect(User.create(
      email: '$%^&@bob.com',
      name: 'Bob Parker',
      password: 'foobarbar',
      password_confirmation: 'foobarbar'
    ).valid?).to be(false)
  end

end