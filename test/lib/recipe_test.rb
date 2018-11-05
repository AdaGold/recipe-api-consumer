require "test_helper"

describe Recipe do
  it "Cannot be initialized with less than 6 parameters" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new "Name"
    }.must_raise ArgumentError
  end

  it "Must initialize parameters properly" do
    recipe = Recipe.new("chicken", "308423948", "picture.jpeg", "recipe.com", ["Dairy-Free", "Soy-Free"], ["Coconutmilk", "Sugar"])
    expect(recipe.label).must_equal "chicken"
    expect(recipe.uri).must_equal "308423948"
    expect(recipe.image_url).must_equal "picture.jpeg"
    expect(recipe.recipe_url).must_equal "recipe.com"
    expect(recipe.dietaryinformation[0]).must_equal "Dairy-Free"
    expect(recipe.ingredients[1]).must_equal "Sugar"



  end

end
