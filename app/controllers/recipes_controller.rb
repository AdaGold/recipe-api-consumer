class RecipesController < ApplicationController

  # def new
  # end

  def index
    # If search q is not empty
    if params[:q].present?
      # recipes is the list of recipes from the EdamamAPIWrapper
      # Show only 10 per page
      @recipes = EdamamApiWrapper.search(params[:q]).paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    # Show one recipe's details page
    @recipe = EdamamApiWrapper.show_details(params[:recipe_id])
  end

end
