class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search_term])
  end


end
