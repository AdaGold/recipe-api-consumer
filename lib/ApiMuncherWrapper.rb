require 'httparty'
# did you change this ? Then restart the server!
class ApiMuncherWrapper
  BASE_URL = "https://api.edamam.com/search"
  # should this be listed as Token/ id instead/ 
  APP_ID = ENV['app_id']
  APP_KEY = ENV['app_key']
  

  def self.get_recipe

    #url = "#{BASE_URL}search?q=#{search_term}&from=#{start_index}&app_id=#{APP_ID}&app_key#{APP_KEY}"
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












