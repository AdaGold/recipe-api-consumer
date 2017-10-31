require "HTTParty"

class MuncherWrapper
  BASE_URL = "https://api.edamam.com/"
  TOKEN_KEY = ENV["APP_KEY"]
  TOKEN_ID = ENV["APP_ID"]

  # search?q=

  def self.find_recipe(search)
    url = BASE_URL + "search?" + "app_id=#{TOKEN_ID}" + "&app_key=#{TOKEN_KEY}" + "&q=#{search}" + "&to=1000"
    response = HTTParty.get(url).parsed_response

    # unless data["ok"]
    #   raise ArgumentError.new("Error!")
    # end
    
    recipes = []
    if response["hits"]
      response["hits"].each do |recipe|
        label = recipe["recipe"]["label"]
        uri = recipe["recipe"]["uri"]
        options = {}
        options["image"] = recipe["recipe"]["image"]
        options["url"] = recipe["recipe"]["url"]
        options["source"] = recipe["recipe"]["source"]
        options["ingredients"] = recipe["recipe"]["ingredients"]
        recipes << Recipe.new(label, uri, options)
      end
    end
    return recipes
  end

  #   response = HTTParty.post(url,
  #   body:  {
  #     "q" => "#{search}",
  #   },
  #   :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
  #   return response.success?
  # end
  def self.getRecipe(uri)
    url = BASE_URL  "search?"  "app_id=#{TOKEN_ID}"  "&app_key=#{TOKEN_KEY}"  "&r=#{uri}"

    response = HTTParty.get(url).parsed_response
    if response != nil
      label = response[0]["label"]
      uri = response[0]["uri"]
      options = {}
      options["image"] = response[0]["image"]
      options["url"] = response[0]["url"]
      options["source"] = response[0]["source"]
      options["ingredients"] = response[0]["ingredients"]
      options["diet_labels"] = response[0]["dietLabels"]
      options["total_nutrients"] = response[0]["totalNutrients"]
      options["calories"] = response[0]["calories"]
      recipe = Recipe.new(label, uri, options)
    else
      return nil
    end
    return recipe
  end
end
# "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=gte%20591,%20lte%20722&health=alcohol-free"
