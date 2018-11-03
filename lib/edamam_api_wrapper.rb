require 'httparty'
require 'awesome_print'
require 'pry'


class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_KEY = ENV["app_key"]
  APP_ID = ENV["app_id"]

  def self.list_recipes(search_term)
    url = BASE_URL + "search?q=#{search_term}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    data = HTTParty.get(url)
    if data["hits"]
      data["hits"].map do |hit|
        uri = hit["recipe"]["uri"]
        image_url = hit["recipe"]["image"]
        recipe_url = hit["recipe"]["url"]
        label = hit["recipe"]["label"]
        dietaryinformation = hit["recipe"]["healthLabels"]
        ingredients = hit["recipe"]["ingredientLines"]

        Recipe.new(label, uri, image_url, recipe_url, dietaryinformation, ingredients)
      end
    else
      return []
    end
  end# return new recipes array

  #   def self.send_msg(channel, msg)
  #     puts "Sending message to channel #{channel}: #{msg}"
  #
  #     url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"
  #     response = HTTParty.post(url,
  #       body:  {
  #         "text" => "#{msg}",
  #         "channel" => "#{channel}",
  #         "username" => "Robert Galbraith",
  #         "icon_emoji" => ":wizard:",
  #         "as_user" => "false"
  #       },
  #       :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
  #
  #       return response.success?
  #   end
end

# ap EdamamApiWrapper.list_recipes("chicken")
