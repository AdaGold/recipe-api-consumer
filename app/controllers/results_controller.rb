class ResultsController < ApplicationController
  
  # https://developer.edamam.com/edamam-docs-recipe-api
  # from Edamam q = query text, r = return of recipe based on it's id 
  # attr_reader :query, :uri
  def index
     @page = '/'
  end

  def show
    # @page = "/"
    # @results = ApiMuncherWrapper.search(params[:query], params[:from])
    # @count = ApiMuncherWrapper.results(params[:query])
    # @query = params[:query]

    # # expect user to be redirected to new search
    # if @results == false
    #   redirect_to results_index_path
    #   flash[:notice] = "Recipe not found. Try Again Please!"
    # else # expect user to be shown serach results
    #   @results_start = params[:from].to_i + 1
    #   @results_end = @results_start + @results.length - 1
    #   # do I need to reset query here, should I clear the field?

    end
  end
end
