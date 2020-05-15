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
      dish_sum = dish_menu["desription"]
     new_dish = Dish.new(name: name, dish_id: dish_id, cuisine: cuisine , sum: dish_sum)
      new_cuisine.dishes << new_dish

    end

  end

  def self.getdishsum(dish)
   key = ENV['MY_SPOON_API_KEY']
   url = "https://api.spoonacular.com/recipes/{id}=#{Dish.dish_id}/summary&apiKey=#{key}"
   response = Net::HTTP.get(URI(url))
   binding.pry

   dishmen = JSON.parse(response).first
   binding.pry
   dish.sum = dishmen("summary")
  end

  def self.similar(dish)
   key = ENV['MY_SPOON_API_KEY']
   url ="https://api.spoonacular.com/recipes/#{dish.dish_id}/similar?&number=3=apiKey#{key}"
   response = Net::HTTP.get(URI(url))
   suggestion= JSON.parse(response)
   dish.dish_id = suggestion("title")
  end

  #def self.hungry(cuisine)
 # key = ENV.fetch('MYSPOON-API-KEY')
 # url = "https://api.spoonacular.com/recipes/complexSearch?=#{key}&cuisine=#{cuisine}&addRecipeInformation=true&number=10"
 # response = Net::HTTP.get(URI(url))
  # dishes= JSON.parse(response)["results"]
  #  new_cuisine = Cuisine.new(cuisine)
  #  dishes.each do |dish_menu|
  #    name = dish_menu["title"]
  #    drink_id = dish_menu["id"]
  #    cuisine = dish_type ["cuisines"]

   #  new_dish = Dish.new(name: name, dish_id: drink_id, cuisine: cuisine)
  #  new_cuisine.dishes << new_dish

end





## service file/class.repsonsible for talking to API. ##going to it , talking ,and returning info.
