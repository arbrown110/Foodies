class API 
  
  def self.get_list(cuisine)
    
    key = ENV.fetch('MYSPOON-API-KEY')
    url = "https://api.spoonacular.com/recipes/#{cuisine}/search?=#{key}&query=number&=10"
    
    response = Net::HTTP.get(URI(url))
    dishes= JSON.parse(response)["results"]
    new_cuisine = Cuisine.new(cuisine)
    dishes.each do |dish_menu|
      name = dish_menu["title"]
      drink_id = dish_menu["id"]
     new_dish = Dish.new(name: name, dish_id: drink_id, cuisine: cuisine)
      new_cuisine.dishes << new_dish
    end
    binding.pry
  end
  
  def self.getdishsum(dish)
   key = ENV.fetch('MYSPOON-API-KEY')
   url = "https://api.spoonacular.com/recipes/#{dish.dish_id}/#{summary}=#{key}"
   response = Net::HTTP.get(URI(url))
   dishmen = JSON.parse(response).first
   dish.summary = dishmen["summary"]
  end
 
  def self.similar(dish)
   key = ENV.fetch ('MYSPOON-API-KEY')
   url ="https://api.spoonacular.com/recipes/#{dish_id}/similar?=#{key}&number=2"
   response = Net::HTTP.get(URI(url))
   suggestion= JSON.parse(response)
   dish.dish_id = suggestion["title"]
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