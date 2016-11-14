require 'httparty'
# did you change this ? Then restart the server!
class ApiMuncherWrapper

  BASE_URL = "https://api.edamam.com/search"
  # should this be listed as Token/ id instead/ 
  APP_ID = ENV['app_id']
  APP_KEY = ENV['app_key']
  

  def self.get_recipes(query, from)

    url = BASE_URL + 
      "?q=#{query}" + 
      "&app_id=#{APP_ID}" + 
      "&app_key=#{APP_KEY}" + 
      "&from=#{from}"

    data = HTTParty.get(url)
    # return data['hits'][0]['recipe']['label']
    recipes = []

    if data['hits']
      data['hits'].each do |recipe|
        label = recipe["recipe"]["label"]
        image = recipe["recipe"]["image"]
        uri = recipe["recipe"]["uri"]
        recipes << {
          name: label,
          pic:  image,
          uri: uri
        }
      end
    end
    return recipes
  end

  def self.get_one_recipe(recipe_id)
    url = BASE_URL + 
      "?r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{recipe_id}" +
      "&app_id=#{APP_ID}" +
      "&app_key=#{APP_KEY}"
    data = HTTParty.get(url)
    return data[0]
  end
end












