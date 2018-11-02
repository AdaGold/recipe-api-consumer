class Recipe
attr_reader :name, :ingredients, :dietaryinformation, :image_url, :recipe_url, :uri

def initialize(name, id, options = {} )
  raise ArgumentError if name == nil || name == "" || id == nil || id == ""

  @name = name
  @id = id
  @uri = hit[recipe]["uri"]
  @dietaryinformation = hit[recipe]["healthLabels"]
  @ingredients = hit[recipe]["ingredientLines"]

  @image_url= options[:is_archived]
  @recipe_url = options[:members]
end
