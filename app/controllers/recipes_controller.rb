require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:message])

    if @recipes.empty?
      flash[:warning] = "No Recipes found for #{params[:message]}. Please refine your search."
      redirect_back fallback_location: root_path
   else
  
     @recipes = @recipes.paginate(page: params[:page], per_page: 10)
   end
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:uri])
    if
      @recipe !=nil
    else
      render_404
    end
  end

end
