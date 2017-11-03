require_dependency '../../lib/muncher_wrapper'
require_dependency '../../lib/recipe'

class RecipesController < ApplicationController

  def root ; end

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

  def show
    @recipe_uri = params[:uri]
    @recipe = MuncherWrapper.show_recipe(@recipe_uri)

    unless @recipe
      head :not_found
    end
  end

  def nutrition
    @recipe_uri = params[:uri]
    @recipe = MuncherWrapper.show_recipe(@recipe_uri)
  end

end
