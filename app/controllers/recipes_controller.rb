class RecipesController < ApplicationController

  def index
    # If search q is not empty
    if params[:q].present?
      # recipes is the list of recipes from the EdamamAPIWrapper
      # Show only 10 per page
      @recipes = EdamamApiWrapper.search(params[:q])
    end
  end

  def show
    # Show one recipe's details page
    @recipe = EdamamApiWrapper.show_details(params[:uri])
  end

end
