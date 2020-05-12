class API 
  
   def self.get_list(cuisine)
     #what is my endpoint
    key = Env.fetch ('MYSPOON-API-KEY')
    url: "https://api.spoonacular.com/recipes/#{cuisine}/search?query=number?apiKey=#{ENV.fetch('MYSPOON-API-KEY')}&=10"
   ##how to I get there and get what I need 
    response = Net::HTTP.get(URI(url))
    
    ## how to i handle json and turn it to something i can work with 
     dishes= JSON.parse(response)["results"]
    
    ##how to i make dish objects
    dishes.each do |dish_menu|
      name = dish_menu["title"]
      drink_id = dish_menu["id"]
      Dish.new(name: name, dish_id: drink_id, cuisine: cuisine)
    end
    #binding.pry
  end
  
  def self.getdishsum(dish)
   #what is my endpoint
   key = Env.fetch ('MYSPOON-API-KEY')
   url = "https://api.spoonacular.com/recipes/#{dish.dish_id}/#{summary}?apiKey=#{ENV.fetch('MYSPOON-API-KEY')}"
   ##how do I go there and get what i need
    response = Net::HTTP.get(URI(url))
   #how do i parse
   dishmen = JSON.parse(response).first
   ##what's going to happen next
   ##add attribute to update existing
   dish.summary = dishmen["summary"]
end
    
  


 
## service file/class.repsonsible for talking to API. ##going to it , talking ,and returning info.