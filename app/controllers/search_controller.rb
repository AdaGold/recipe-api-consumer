require "#{Rails.root}/lib/ApiMuncherWrapper.rb"
# require "#{Rails.root}/lib/recipe.rb"
class SearchController < ApplicationController

  def index
    @results = ApiMuncherWrapper.get_recipes(params[:search])
    # puts "!!!!!!!!!!!!!!"
    # puts params.inspect 
    # puts "!!!!!!!!!!!!!!"
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
