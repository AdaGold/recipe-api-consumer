require 'httparty'

class ApiMuncherWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = 'APP_ID'
  APP_KEY = 'APP_KEY'
  
  # https://developer.edamam.com/edamam-docs-recipe-api
  # from Edamam q = query text, r = return of recipe based on it's id
  attr_reader :recipe, :q, :url, :image, :returns, :r
  def initialize(recipe, q, url, image, returns, r)
    @recipe = recipe
    @q = q
    @url = url
    @image = image
  end
end