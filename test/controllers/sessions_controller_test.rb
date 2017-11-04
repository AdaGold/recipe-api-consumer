require "test_helper"

describe SessionsController do
  describe "create" do
    it "logs in a user" do
      start_count = User.count
      user = users(:ada)
      login(user)
      must_redirect_to root_path
      session[:user_id].must_equal  user.id
      User.count.must_equal start_count
    end
  end

  describe "destroy" do
    it "logs a user out" do
      user = users(:ada)
      login(user)
      get signout_path(user)
      must_redirect_to root_path
      session[:user_id].must_equal  nil
    end
  end
end
