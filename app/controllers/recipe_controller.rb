class RecipeController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(search_term)

  end
end
