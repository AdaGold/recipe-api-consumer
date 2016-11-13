require "#{Rails.root}/lib/ApiMuncherWrapper.rb"
# require "#{Rails.root}/lib/recipe.rb"
class SearchController < ApplicationController

  def index
    search = params[:search]
    from = params[:from]
    # from is nil here
    if from == nil
      from = 0
    end
    @results = ApiMuncherWrapper.get_recipes(search, from)

    @foobar = "hello world"
  end 

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
  end
end
