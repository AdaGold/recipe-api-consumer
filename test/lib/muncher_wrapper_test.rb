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
          recipe.must_be_kind_of Recipe
        end
      end
    end

    # negative test
    it "can't search for fake data" do
      VCR.use_cassette("recipes") do
        recipes = MuncherWrapper.find_recipe(".")
        recipes.must_equal []
      end
    end
  end
end


describe "show_recipe" do

  # positive test
  it "returns a recipe successfully" do

    VCR.use_cassette("recipes") do
      all_chicken = MuncherWrapper.find_recipe("chicken")
      recipe = MuncherWrapper.show_recipe(all_chicken[0].uri)

      recipe.must_be_instance_of Recipe
      recipe.label.must_equal all_chicken[0].label
    end
  end
  # negative test
  it "doesn't return a fake recipe" do
############ FILL IN #########
  end

end
