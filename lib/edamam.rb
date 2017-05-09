require 'httparty'



class Edamam
  BASE_URL = 'https://api.edamam.com/'

  class EdamamException <  StandardError
  end

  attr_reader :recipe_uri, :from, :hit_array, :hits

  def initialize(uri = "", from = "")
    @hit_array = []
    @recipe_uri = uri
    @from = from
    @hits = ""

  end



  def all(query, from = 0)
    url = "#{BASE_URL}search?"
    query_params = {
      "app_key" => ENV["API_KEY"],
      "app_id"=>  ENV["API_ID"],
      "q" => query,
      "from" => from,
      "to" => from.to_i + 9
}

    response = HTTParty.get(url, query:query_params).parsed_response
    @hits = self.clean(response)
    @from = response["from"]
    @hit_array = make_hit_array


#Create an array object to hold all of the hits


    if response["count"] > 1
    return response
    else
      raise EdamamException.new("Your search returned no results")
    end
  end

  def make_hit_array
    @hits.each do |number, recipe|
      number = Hash.new
      number["r"] = recipe["uri"]
      number["from"] = self.from
      @hit_array << number
    end
  end

  def clean(response)
    if response["hits"].present?
      hash = {}
      response["hits"].each_with_index{|item, i|hash[i] = item["recipe"]}
      return hash
    else
      puts = "Your search could not be executed"
      raise EdamamException.new("Your search could not be executed")
    end

  end

  def find(r,from)
    url = "#{BASE_URL}search?"
    query_params = {
      "app_key" => ENV["API_KEY"],
      "app_id"=>  ENV["API_ID"],
      "r" => r,
      "from" => from
    }
    response = HTTParty.get(url, query:query_params).parsed_response
    return response
  end



end
