require 'edamam'
class SearchController < ApplicationController


  def index
    @search =Edamam.new

    begin
      @search.all(params[:query], params[:from])
      @searches = @search.hits
      @search_object = @search.hit_array
    rescue Edamam::EdamamException
    flash[:message] = "Your search returned no results"
    render :welcome
    end
  end

  def show
    @search = Edamam.new.find(params[:uri], params[:from])

  end


end
