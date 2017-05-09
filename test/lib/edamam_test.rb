require 'test_helper'

describe Edamam do

  describe "initialize" do
    it "takes a uri and a from" do
      uri = "www.google.com"
      from = 10

      search = Edamam.new(uri, from)
      search.class.must_equal Edamam
      search.recipe_uri.must_equal "www.google.com"
      search.from.must_equal 10
      search.hit_array.length.must_equal 0
    end
  end

  describe ".all" do
    it "Can send valid request and return real data with both parameters" do
      VCR.use_cassette("searchy") do
        query = "cake"
        from = 0
        search = Edamam.new

        search.hit_array.length.must_be :>, 1
        search.from.must_equal from
        search.recipe_uri.nil?.must_equal false
      end
    end

    it "raises an error if given bad data" do
      VCR.use_cassette("no-searchy") do
        query = ""
        from = 0
        search = Edamam.new
          proc {
              search.all(query, from)
            }.must_raise Edamam::EdamamException
      end
    end

    it "raises an error if given query that returns no results" do
      VCR.use_cassette("no-searchy") do
        query = "chickena"
        from = 0
        search = Edamam.new
          proc {
              search.all(query, from)
            }.must_raise Edamam::EdamamException
      end
    end



  end




  describe "clean" do
    it "creates a hash of the API hits" do
      VCR.use_cassette("searchy") do
        query = "cake"
        from = 0
        search = Edamam.new

        search.hits.class.must_equal Hash
        search.hits[1]["uri"].nil?.must_equal false
        search.hits[1]["label"].nil?.must_equal false
        search.hits[1]["image"].nil?.must_equal false
      end
    end

  end

  describe "find" do
    it "can find a single recipe" do
      VCR.use_cassette("lookup") do
        main_search = Edamam.new
        query = "cake"
        from = 0
        main_search.all(query, from)
        single_recipe = main_search.find(main_search.recipe_uri, main_search.from)
        # print single_recipe.parsed_response
      end
    end
  end

end
