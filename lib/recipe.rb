class Recipe
  attr_reader :label, :uri, :image, :source, :ingredients, :url, :diet_labels, :yield, :total_nutrients, :calories

  def initialize(label, uri, options = {})
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = URI.encode(uri)

    @image = options["image"]
    @source = options["source"]
    @ingredients = options["ingredients"]
    @url = options["url"]
    @diet_labels = options["diet_labels"]
    @yield = options["yield"]
    @total_nutrients = options["total_nutrients"]
    @calories = options["calories"]
  end

end
