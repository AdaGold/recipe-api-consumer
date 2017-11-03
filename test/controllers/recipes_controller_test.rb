require "test_helper"

describe RecipesController do

  describe "root" do
    it "shows a home page" do
      get root_path
      must_respond_with :success
    end

    ############ need negative test? #########

  end


  describe "index" do
    it "shows the search result of search" do
      search = "lemon"
      VCR.use_cassette("search") do
        MuncherWrapper.find_recipe(search)
        get search_recipe_path(search: search)
        must_respond_with :success
      end
      # what other things could I test here? maybe that it's not empty?

    end

    it "doesn't show when given bad search terms" do
      search = "sdfsdfsdeaseaea"
      VCR.use_cassette("search") do
        MuncherWrapper.find_recipe(search)
        get search_recipe_path(search: search)
        must_redirect_to root_path
      end
    end
  end

  describe "show" do
    it "shows a particular recipe page" do
      VCR.use_cassette("show_recipe") do
        label = "test_label"
        uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2"
        recipe = MuncherWrapper.show_recipe(uri)
        recipe.must_be_kind_of Recipe
        get recipe_path(label: label, uri: uri)
        must_respond_with :success
      end
    end

    it "renders :not_found for bad uri" do
      VCR.use_cassette("show_recipe") do
        label = "test_label"
        uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_1111111111111"
        recipe = MuncherWrapper.show_recipe(uri)
        recipe.must_equal nil
        get recipe_path(label: label, uri: uri)
        must_respond_with :not_found
      end
    end
  end
  describe "nutrition" do
    it "brings user to nutrition info" do
      VCR.use_cassette("nutrition") do
        label = "test_label"
        uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2"
        get nutrition_path(label: label, uri: uri)
        must_respond_with :success
      end
    end
  end

end
