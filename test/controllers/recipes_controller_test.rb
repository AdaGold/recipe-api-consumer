require "test_helper"

describe RecipesController do
  it "should get index" do
      VCR.use_cassette("recipes") do
        search_term = "chicken"
        response = EdamamApiWrapper.list_recipes(search_term)
        get recipes_index_path
        binding.pry
        must_respond_with :success
      end
  end

end
