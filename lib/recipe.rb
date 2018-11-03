class Recipe
  attr_reader :label, :ingredients, :dietaryinformation, :image_url, :recipe_url, :uri

  def initialize(label, uri, image_url, recipe_url, dietaryinformation, ingredients)
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = uri
    @image_url= image_url
    @recipe_url = recipe_url
    @dietaryinformation = dietaryinformation
    @ingredients = ingredients
  end


end
