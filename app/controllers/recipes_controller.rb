class RecipesController < ApplicationController

# perhaps move this to a root homepage controller?
# index
  def root ; end
  # def search
  #   @recipes = MuncherWrapper.find_recipe(search)
  # end

  def index
    @search = params[:search]
     recipes = MuncherWrapper.find_recipe(@search)
     @recipes = recipes.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @recipe = MuncherWrapper.getRecipe(params[:uri])
  end

end

# 1- user will search and it will display a list (so index?) of all results

# 2- that list view will show 10 recipe names and an image at a time

# 3- This shall show the details about a given recipe. These details include:
# Name
# Link to the original recipe (opens in a new tab)
# Ingredients
# Dietary information
