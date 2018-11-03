class Recipe
attr_reader :label, :ingredients, :dietaryinformation, :image_url, :recipe_url, :uri

def initialize(label, uri, image_url, recipe_url)
  raise ArgumentError if name == nil || name == "" || id == nil || id == ""

  @label = label
  @uri = uri
  @image_url= image_url
  @recipe_url = recipe_url
  @dietaryinformation = dietaryinformation
  @ingredients = ingredients


end
