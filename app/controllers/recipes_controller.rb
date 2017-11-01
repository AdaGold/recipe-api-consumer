require 'HTTParty'
require_dependency './lib/muncher_wrapper'
require_dependency './lib/recipe'
# require 'recipe'
# require 'muncher_wrapper'

class RecipesController < ApplicationController

  def root ; end
  # 1- user will search and it will display a list  of all results
  # 2- that list view will show 10 recipe names and an image at a time
  def index
    @search = params[:search]
    results = MuncherWrapper.find_recipe(@search)
    if results.empty?
      flash[:status] = :failure
      flash[:message] = "Your search for '#{params[:search]}' had no results. Try again!"
      redirect_to root_path
    else
      @recipes = results.paginate(:page => params[:page], :per_page => 10)
      return @recipes
    end
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
  private
  # def save_and_flash(model, edit: "create", save: model.save, name: model.name)
  #   result = save
  #   if result
  #     flash[:status] = :success
  #     flash[:message] = "Successfully #{edit}d #{model.class} #{name}"
  #   else
  #     flash.now[:status] = :failure
  #     flash.now[:message] = "Could not #{edit} #{model.class}"
  #     flash.now[:details] = model.errors.messages
  #     return false
  #   end
  # end
end
