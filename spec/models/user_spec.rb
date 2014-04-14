require 'spec_helper'

describe User do  

  describe "Create Ne Userw" do

    it "should fail with an invalid email" do
      expect(User.create(
        email: '$%^&@bob.com',
        name: 'Bob Parker',
        password: 'foobarbar',
        password_confirmation: 'foobarbar'
      ).valid?).to be(false)
    end

    it "should create a remember token after create" do 
      user = User.create(
        email: 'bobparker@gmail.com',
        name: 'Bob Parker',
        password: 'foobarbar',
        password_confirmation: 'foobarbar'
      )
      expect(user.remember_token).not_to be_nil 
    end

    it "should downcase the email before saving to the database" do
      user = User.create(
        email: 'BOBPARKER@gmail.com',
        name: 'Bob Parker',
        password: 'foobarbar',
        password_confirmation: 'foobarbar'
      )

      expect(user.email === user.email.upcase).to be false

    end
  end
end