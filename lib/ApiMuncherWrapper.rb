require 'httparty'

class ApiMuncherWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = 'APP_ID'
  APP_KEY = 'APP_KEY'

  attr_reader :recipe, :query, :url, :image, :returns, :r
  
end