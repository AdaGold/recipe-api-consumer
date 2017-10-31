require "HTTParty"
require 'recipe'
require 'muncher_wrapper'
class RecipesController < ApplicationController

  def root ; end
  # 1- user will search and it will display a list  of all results
  # 2- that list view will show 10 recipe names and an image at a time
  def index
    @search = params[:search]
    recipes = MuncherWrapper.find_recipe(@search)
    @recipes = recipes
  end
  # 3- This shall show the details about a given recipe. These details include:
  # Name
  # Link to the original recipe (opens in a new tab)
  # Ingredients
  # Dietary information
  def show
    @recipe_uri = params[:uri]
    @recipe = MuncherWrapper.show_recipe(@recipe_uri)
  end

end
