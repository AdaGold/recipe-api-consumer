require 'test_helper'

describe MuncherWrapper do
  it "can get a list of recipes" do
    VCR.use_cassette("recipes") do
      response = MuncherWrapper.find_recipe("chicken")
      #check something
    end
  end


end
