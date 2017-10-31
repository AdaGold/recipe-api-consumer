class Recipe
  attr_reader :label, :uri, :image, :source, :ingredients, :url, :diet_labels, :total_nutrients, :calories

  def initialize(label, uri, options = {})
    @label = label
    @uri = URI.escape(uri)

    @image = options["image"]
    @source = options["source"]
    @ingredients = options["ingredients"]
    @url = options["url"]
    @diet_labels = options["diet_labels"]
    @total_nutrients = options["total_nutrients"]
    @calories = options["calories"]
  end

end
