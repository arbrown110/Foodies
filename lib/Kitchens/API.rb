require 'pry'
class API

  def self.get_dishes(cuisine)

     key = ENV['MY_SPOON_API_KEY']
    url = "https://api.spoonacular.com/recipes/complexSearch?cuisine=#{cuisine}&addRecipeInformation=true&offset=0&number=10&apiKey=#{key}"

    response = Net::HTTP.get(URI(url))
    dishes= JSON.parse(response)["results"]
    new_cuisine = Cuisine.new(cuisine)


    dishes.each do |dish_menu|

      name = dish_menu["title"]
      dish_id = dish_menu["id"]
      dish_sum = dish_menu["summary"]
      new_dish = Dish.new(name: name, dish_id: dish_id, cuisine: cuisine , sum: dish_sum)
      new_cuisine.dishes << new_dish

    end

  end

  def self.getdishsum(dish)
   key = ENV['MY_SPOON_API_KEY']

   url = "https://api.spoonacular.com/recipes/#{dish.dish_id}/summary?&apiKey=#{key}"
   response = Net::HTTP.get(URI(url))
   dishmen = JSON.parse(response)["summary"]
   new_summary = Dish.new(dishmen)





  end
end
