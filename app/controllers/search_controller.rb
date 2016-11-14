require "#{Rails.root}/lib/ApiMuncherWrapper.rb"
# require "#{Rails.root}/lib/recipe.rb"
class SearchController < ApplicationController

  def index
    search = params[:search]
    from = params[:from]

    if from == nil
      from = 0
    else 
      from = from.to_i
    end

    @next_page = search_index_path + "?search=#{search}&from=#{from + 10}" 
    @prev_page = search_index_path + "?search=#{search}&from=#{from - 10}"
    @results = ApiMuncherWrapper.get_recipes(search, from)
  end 

  def new
  end
end
