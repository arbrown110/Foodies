class API 
  
  def self.#ahsnd(dish)
    key = Env.fetch ('spoonacular_key')
    url: "Http://whateversays=#{dish}&apikey=#{ENV.fetch('spoonacular_key')}"
    response = Net::HTTP.get(URI(url))
    
    dish = Json.parse(response)
    new_dish = Dish.new(dish)
    #binding.pry

   dish.each_with_index do | summary , index|
    url = "http://whateveritsays#{summary}["id"]}/whateveritsays?apiKey=#{ENV.fetch('spoonacular_key')}"
    #binding.pry
    response = Net::HTTP.get(URI(url))
    #ahsnd = Json.parse(response)
    new_recipe = Dish.find_or_create_by_name(summay["title"])
    
  end
end  