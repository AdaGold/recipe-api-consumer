require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEYS = ENV["EDAMAM_APP_KEYS"]

  def self.search(search_term)
    search_url = BASE_URL + "?q=#{search_term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEYS}&from=0&to=30"
    response = HTTParty.get(search_url)
    search_results = []

    if response["hits"]
      response["hits"].each do |hit|
        # move to private method?
        wrapped_hit = Recipe.new(
          hit["recipe"]["uri"],
          hit["recipe"]["label"],
          hit["recipe"]["image"],
          hit["recipe"]["source"],
          hit["recipe"]["url"],
          hit["recipe"]["yield"],
          hit["recipe"]["ingredientLines"],
          hit["recipe"]["healthLabels"]
        )

        search_results << wrapped_hit
      end # of each loop
    end # of if

    return search_results
  end # of def search


  def self.find_details(recipe_id)
    # url = BASE_URL + "?q=#{search_term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEYS}&from=0&to=30"
    url = BASE_URL + "?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23" + "recipe_#{recipe_id}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEYS}"

    response = HTTParty.get(url)

    if response[0]
        # move instantiation to private method?
        recipe = Recipe.new(
          response[0]["uri"],
          response[0]["label"],
          response[0]["image"],
          response[0]["source"],
          response[0]["url"],
          response[0]["yield"],
          response[0]["ingredientLines"],
          response[0]["healthLabels"]
        )
        # without [0] gave "no implicit conversion of string into integar" error. why need index if only one?
        return recipe
    end
  end

end # of Class
