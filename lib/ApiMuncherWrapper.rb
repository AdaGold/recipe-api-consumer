require 'httparty'

class ApiMuncherWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = 'APP_ID'
  APP_KEY = 'APP_KEY'

  # from Edamam q = query, r = return
  attr_reader :recipe, :q, :url, :image, :returns, :r
  def initialize(recipe, q, url, image, returns, r)

  end
end