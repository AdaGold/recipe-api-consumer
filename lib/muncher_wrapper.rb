class MuncherWrapper
  BASE_URL = "https://api.edamam.com/"
  TOKEN_KEY = ENV["APP_KEY"]
  TOKEN_ID = ENV["APP_ID"]

  def self.find_recipe(search, app_id=TOKEN_ID, app_key=TOKEN_KEY)
    url = BASE_URL + "search?" + "app_id=#{app_id}" + "&app_key=#{app_key}" + "&q=#{search}" + "&to=1000"
    response = HTTParty.get(url).parsed_response

    recipes = []
    if response["hits"]
      response["hits"].each do |recipe|
        label = recipe["recipe"]["label"]
        uri = recipe["recipe"]["uri"]
        options = {}
        options["image"] = recipe["recipe"]["image"]
        # options["url"] = recipe["recipe"]["url"]
        # options["source"] = recipe["recipe"]["source"]
        # options["ingredients"] = recipe["recipe"]["ingredients"]
        recipes << Recipe.new(label, uri, options)
      end
    end
    return recipes
  end

  def self.show_recipe(uri)
    url = BASE_URL + "search?" + "app_id=#{TOKEN_ID}" + "&app_key=#{TOKEN_KEY}" + "&r=#{uri}"

    response = HTTParty.get(url).parsed_response
    unless response.empty?
      label = response[0]["label"]
      uri = response[0]["uri"]
      options = {}
      options["image"] = response[0]["image"]
      options["url"] = response[0]["url"]
      options["source"] = response[0]["source"]
      options["ingredients"] = response[0]["ingredients"]
      options["diet_labels"] = response[0]["dietLabels"]
      options["yield"] = response[0]["yield"]
      options["total_nutrients"] = response[0]["totalNutrients"]
      options["calories"] = response[0]["calories"]
      recipe = Recipe.new(label, uri, options)
      return recipe
    else
      return nil
    end
  end

end
