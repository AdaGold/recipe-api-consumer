require "test_helper"

describe User do
  describe "self.from_auth_hash" do
    it "can be called" do
      User.must_respond_to :from_auth_hash
    end

    it "returns an instance of user" do
      user = users(:ada)
      auth_hash = mock_auth_hash(user)
      user_instance = User.from_auth_hash(auth_hash)

      user_instance.must_be_instance_of User
    end
  end
end
