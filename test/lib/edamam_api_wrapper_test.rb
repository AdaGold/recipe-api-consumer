require "test_helper"

describe EdamamApiWrapper do
  it "Can request valid search information" do
    VCR.use_cassette("recipes") do
      search_term = "chicken"
      response = EdamamApiWrapper.list_recipes(search_term)
      expect(response[0]).must_be_instance_of Recipe
      expect(response.count).must_be :>=, 1
      expect(response[0].label).must_equal "Teriyaki Chicken"
      expect(response[0].uri).must_equal "7bf4a371c6884d809682a72808da7dc2"
      expect(response[0].ingredients[0]).must_equal "1/2 cup (125ml) mirin"
    end
  end

  it "Can't find recipes for an invalid search" do
    VCR.use_cassette("recipes") do
      search_term = "asldjfkla"
      response = EdamamApiWrapper.list_recipes(search_term)
      #  binding.pry
      response.must_equal []
    end
  end

  it "can return a single recipe with a valid uri" do
    VCR.use_cassette("recipes") do
      uri = "7bf4a371c6884d809682a72808da7dc2"
      response = EdamamApiWrapper.find_recipe(uri)
      expect(response).must_be_instance_of Recipe
      expect(response.label).must_equal "Teriyaki Chicken"
      expect(response.uri).must_equal "7bf4a371c6884d809682a72808da7dc2"
      expect(response.ingredients[0]).must_equal "1/2 cup (125ml) mirin"
    end
  end

  it "returns an empty array for an invalid URI" do
    VCR.use_cassette("recipes") do
      uri = "234820394"
      response = EdamamApiWrapper.find_recipe(uri)
      expect(response).must_equal []
    end
  end

end

# it "should get index" do
#   get recipes_index_url
#   value(response).must_be :success?
# end
