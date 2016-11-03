require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["app_id"]
  KEY = ENV["app_key"]

  def self.listrecipes(search_term)
    # This is a gross :(
    Dotenv.load
    @edamam_id ||= ENV["app_id"]
    @edamam_key ||= ENV["app_key"]

    url = BASE_URL + search_term + "&app_id=#{@edamam_id}&app_key=#{@edamam_key}"
    data = HTTParty.get(url)
    recipe_list = []

    if data["hits"]
      data["hits"].each do |hit|
        wrapper = Recipe.new(hit["recipe"]["label"], hit["recipe"]["uri"], info = { image: hit["recipe"]["image"], yield: hit["recipe"]["yield"], level: hit["recipe"]["level"], summary: hit["recipe"]["summary"], calories: hit["recipe"]["calories"], ingredients: hit["recipe"]["ingredients"], dietLabels: hit["recipe"]["dietLabels"], healthLabels: hit["recipe"]["healthLabels"], url: hit["recipe"]["url"]})

        recipe_list << wrapper
      end
    end
    return recipe_list
  end
end
