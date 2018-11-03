class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:message])
    #binding.pry
  end


end
