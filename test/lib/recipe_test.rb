require 'test_helper'

describe Recipe do

  it "can be instantiated with a label and uri" do
    Recipe.new("label", "uri")
  end

  it "requires a label and uri" do
    proc {
      Recipe.new()
    }.must_raise ArgumentError

    proc {
      Recipe.new("label")
    }.must_raise ArgumentError

  end

  it "tracks label and uri" do
    label = "test_label"
    uri = "test_uri"
      recipe = Recipe.new(label, uri)
      recipe.label.must_equal label
      recipe.uri.must_equal uri
  end

  it "tracks optional arguments " do
    options = {
      image: "test_image",
      source: "test_source",
      ingredients: "test_ingredients",
      url: "test_url",
      diet_labels: "test_diet_labels",
      total_nutrients: "test_total_nutrients",
      calories: "test_calories",
    }
    recipe = Recipe.new("label", "uri", options)

    recipe.image.must_equal options["image"]
    recipe.source.must_equal options["source"]
    recipe.ingredients.must_equal options["ingredients"]
    recipe.url.must_equal options["url"]
    recipe.diet_labels.must_equal options["diet_labels"]
    recipe.total_nutrients.must_equal options["total_nutrients"]
    recipe.calories.must_equal options["calories"]
  end

end
