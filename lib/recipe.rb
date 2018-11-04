class Recipe
  attr_reader :uri, :recipe_name, :image, :source, :url, :servings, :ingredients, :health_labels

  def initialize(uri, recipe_name, image, source, url, servings, ingredients, health_labels)
  # use keyword args?

  # uri is the unique identifier. use as id?
    @uri = uri
    @recipe_name = recipe_name
    @image = image
    @source = source
    @url = url
    @servings = servings
    @ingredients = ingredients
    @health_labels = health_labels
  end

end
