require "test_helper"

describe SessionsController do
  it "logs in a user" do
    user = users(:ada)
    login(user)
    must_redirect_to root_path
    session[:user_id].must_equal  user.id
  end
end
