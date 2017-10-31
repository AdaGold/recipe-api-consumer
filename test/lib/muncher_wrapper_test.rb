require 'test_helper'

describe MuncherWrapper do
  describe "find_recipe" do

    # positive test
    it "can get a list of recipes" do
      VCR.use_cassette("recipes") do
        response = MuncherWrapper.find_recipe("chicken")
        response.must_be_kind_of Array
        # response.length.must_be :>, 0
        response.each do |recipe|
          recipe.must_be_a_kind_of Recipe
        end
      end
    end

    # negative test
    it "can't search for fake data" do

    end

  end

  describe "getRecipe" do

    # positive test
    it "returns a recipe successfully" do

    end

    # negative test
    it "doesn't return a fake recipe" do

    end

  end

end


#
