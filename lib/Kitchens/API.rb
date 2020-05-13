class API 
  
  def self.get_list(cuisine)
    
    key = ENV.fetch ('MYSPOON-API-KEY')
    url: "https://api.spoonacular.com/recipes/#{cuisine}/search?query=number?apiKey=#{ENV.fetch('MYSPOON-API-KEY')}&=10"
     
    response = Net::HTTP.get(URI(url))
    dishes= JSON.parse(response)["results"]
    dishes.each do |dish_menu|
    name = dish_menu["title"]
    drink_id = dish_menu["id"]
    Dish.new(name: name, dish_id: drink_id, cuisine: cuisine)
    end
    #binding.pry
  end
  
  def self.getdishsum(dish)
   key = ENV.fetch ('MYSPOON-API-KEY')
   url = "https://api.spoonacular.com/recipes/#{dish.dish_id}/#{summary}?apiKey=#{ENV.fetch('MYSPOON-API-KEY')}"
   response = Net::HTTP.get(URI(url))
   dishmen = JSON.parse(response).first
   dish.summary = dishmen["summary"]
  end


end
    
  


 
## service file/class.repsonsible for talking to API. ##going to it , talking ,and returning info.