require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.build(:user) }

  describe "passwords" do
    it "needs a password and confirmation to save" do
      user.password_confirmation = "pass"
      user.save
      expect(user).to_not be_valid

      user.password = "password"
      user.password_confirmation = ""
      user.save
      expect(user).to_not be_valid

      user.password_confirmation = "password"
      user.save
      expect(user).to be_valid
    end

    it "needs password and confirmation to match" do
      u = User.create(
          name: "steve",
          password: "hunter2",
          password_confirmation: "hunter")
      expect(u).to_not be_valid
    end
  end

  describe "authentication" do
    let(:user) { User.create(
      name: "steve",
      password: "hunter2",
      password_confirmation: "hunter2") }

    it "authenticates with a correct password" do
      expect(user.authenticate("hunter2")).to be
    end
    
    it "does not authenticate with an incorrect password" do
      expect(user.authenticate("hunter1")).to_not be
    end
  end
end
