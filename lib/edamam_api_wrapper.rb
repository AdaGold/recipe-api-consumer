require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV[EDAMAM_APP_ID]
  APP_KEYS = ENV[EDAMAM_APP_KEYS]

  def self.search(search_term)
    search_url = BASE_URL + "search?" + "q=#{search_term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEYS}&from=0&to=30"

    # request = HTTParty.get(search_url,
    #   body: {
    #     "q" => search_term,
    #     "app_id" =>
    #     "app_key"
    #   },
    #   headers: {
    #
    #   }
    # )
  end

  def self.show_details(recipe_url)
  end

end
