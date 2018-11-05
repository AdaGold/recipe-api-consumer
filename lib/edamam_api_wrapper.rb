require 'httparty'
require 'awesome_print'
require 'pry'


class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_KEY = ENV["app_key"]
  APP_ID = ENV["app_id"]
  RETURN_RECIPE= "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23"


  def self.list_recipes(search_term)
    url = BASE_URL + "search?q=#{search_term}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=100"
    data = HTTParty.get(url)
    recipes = []
    if data["hits"]
      data["hits"].map do |hit|
        #binding.pry
        #binding.pry
        recipes << make_recipe(hit["recipe"])
      end
      return recipes
    else
      return []
    end
  end# return new recipes array

  def self.format_uri(uri)
    change_uri = uri.split('_')
    r = change_uri[1]
    return r
  end

  def self.make_recipe(data_source)
    uri = format_uri(data_source["uri"])
    image_url = data_source["image"]
    recipe_url = data_source["url"]
    label = data_source["label"]
    dietaryinformation = data_source["healthLabels"]
    ingredients = data_source["ingredientLines"]

    recipe = Recipe.new(label, uri, image_url, recipe_url, dietaryinformation, ingredients)
    return recipe
  end


def self.find_recipe(uri)

  api_url = BASE_URL + "search?&app_id=#{APP_ID}&app_key=#{APP_KEY}" + "&r=#{RETURN_RECIPE}#{uri}"
  data = HTTParty.get(api_url)
  #binding.pry
  if data[0]
    make_recipe(data[0])
  else
    return []
  end
end# return n
end
