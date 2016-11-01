require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["app_id"]
  KEY = ENV["app_key"]

  def self.listrecipes(search_term)
    url = BASE_URL + "q=" + search_term + "&app_id=#{ID}&app_key=#{KEY}"
    data = HTTParty.get(url)
    recipe_list = []
    if data["recipes"]
      data["recipes"].each do |recipe|
        wrapper = Recipe.new recipe["name"], recipe["id"] , purpose: recipe["purpose"], is_archived: recipe["is_archived"], members: recipe["members"]
        recipe_list << wrapper
      end
    end
    return recipe_list
  end
end
