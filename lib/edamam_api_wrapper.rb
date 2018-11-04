require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV[EDAMAM_APP_ID]
  APP_KEYS = ENV[EDAMAM_APP_KEYS]

  def self.search(search_term)
    search_url = BASE_URL + "?q=#{search_term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEYS}&from=0&to=30"
    response = HTTParty.get(search_url)
    search_results = []

    if response["hits"]
      response["hits"].each do |hit|
        # move to private method?
        wrapped_hit = Recipe.new(
          hit["recipe"]["uri"],
          hit["recipe"]["label"]
          hit["recipe"]["image"]
          hit["recipe"]["source"]
          hit["recipe"]["url"]
          hit["recipe"]["yield"]
          hit["recipe"]["ingredientLines"]
          hit["recipe"]["healthLabels"]
        )

        search_results << wrapped_hit
    end

    return search_results
  end


  def self.show_details(recipe_uri)
    recipe_url = BASE_URL

    response = HTTParty.get(

    if response
        # move instantiation to private method?
        recipe = Recipe.new(
          response["uri"],
          response["label"]
          response["image"]
          response["source"]
          response["url"]
          response["yield"]
          response["ingredientLines"]
          response["healthLabels"]
        )

        return recipe
    end

  end

# private
#
#   self.create_recipe(api_params)
#     return Recipe.new(
#       hits[recipe][uri]
#     )
end
