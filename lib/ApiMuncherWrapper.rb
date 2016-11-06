require 'httparty'
# did you change this ? Then restart the server!
class ApiMuncherWrapper
  BASE_URL = "https://api.edamam.com/search"
  # should this be listed as Token/ id instead/ 
  APP_ID = ENV['app_id']
  APP_KEY = ENV['app_key']
  
  # https://developer.edamam.com/edamam-docs-recipe-api
  # from Edamam q = query text, r = return of recipe based on it's id
  # attr_reader :recipe, :q, :url, :image, :returns, :r
  # def initialize(recipe, q, url, image, returns, r)
  #   @recipe = recipe
  #   @q = q
  #   @url = url
  #   @image = image
  # end

  def self.get_recipe
    url = BASE_URL + "?q=bacon&from=0&to=10" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    data = HTTParty.get(url)
    # return data['hits'][0]['recipe']['label']
    recipes = []

    if data['hits']
      data['hits'].each do |recipe|
        label = recipe["recipe"]["label"]
        image = recipe["recipe"]["image"]
        recipes << {
          name: label,
          pic:  image 
        }
      end
    end
    return recipes
  end
end












