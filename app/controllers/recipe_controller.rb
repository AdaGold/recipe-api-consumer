require "#{Rails.root}/lib/ApiMuncherWrapper.rb"

class RecipeController < ApplicationController

  def index
  end

  def show
    recipe_id = params[:id]
    @recipe = ApiMuncherWrapper.get_one_recipe(recipe_id)
  end

  def destroy
  end
end
