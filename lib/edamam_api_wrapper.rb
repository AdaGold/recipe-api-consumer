require 'httparty'
require 'awesome_print'
require 'pry'


class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  APP_KEY = ENV["app_key"]
  APP_ID = ENV["app_id"]

  def self.list_recipes(search_term)
    url = BASE_URL + "q=#{search_term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{search_term}"
    data = HTTParty.get(url)
      binding.pry
    if data["hits"]
      data["hits"].each do |hit|
        image_url = hit[recipe]["image"]
        recipe_url = hit[recipe]["url"]

        name = hit[recipe]["label"]
      #data["hits"] = array of hashes
      #array[0]
      return data["hits"]
    else
      return []
    end
  end

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

ap EdamamApiWrapper.list_recipes("chicken")
