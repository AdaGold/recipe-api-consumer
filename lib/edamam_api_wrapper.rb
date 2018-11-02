require 'httparty'
require 'awesome_print'
require 'pry'


class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  TOKEN = ENV["app_key"]
  ID = ENV["app_id"]

  # def self.list_recipes(search_term)
  #   url = BASE_URL + "q=#{search_term}" + "&app_id=#{ID}" + "&app_key=#{TOKEN}" + "&q=#{search_term}"
  #   data = HTTParty.get(url)
  #     binding.pry
  #   if data["hits"]
  #     return data["hits"]
  #   else
  #     return []
  #   end
  # end

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
