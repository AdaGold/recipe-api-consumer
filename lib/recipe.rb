class Recipe
  attr_reader :id, :name, :image, :source, :url, :servings, :ingredients, :health_labels

  def initialize(uri, name, image, source, url, servings, ingredients, health_labels)
  # use keyword args?

  # uri is the unique identifier. use as id?
    @id = uri.last(32)
    @name = name
    @image = image
    @source = source
    @url = url
    @servings = servings
    @ingredients = ingredients
    @health_labels = health_labels
  end

end
