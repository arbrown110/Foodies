class CLI

  def run 
    puts "  "
    puts "WELCOME TO FOODIES !!!!!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    
    prompt_cuisine
    prompt_user
    input = get.strip.downcase
    
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "

    while input != 'exit'
      if input ==  'menu'
        
        dishes = Cuisine.find_by_cuisine(@cuisine).dishes
        print_dish(dishes)
      elsif input.to_i > 0 && input.to_i < Cuisine.find_by_cuisine(@cuisine).length 
        binding.pry
        dish = Cuisine.find_by_cuisine(@cuisine).dishes[input.to_i - 1]
        #if they put dish go to summary for input
        API.getdishsum(dish) if !dish.summary
        
        print_dish(dish)
      elsif input == 'cuisines'
        prompt_cuisine
       
        #if they pick different dish show that summary
      else
        puts "what type of food is that? Take another look ."
      end
       prompt_user
       input = gets.strip.downcase
    end
    puts " "
    puts "I don't know about you but I'm full ! See you next time."
  end  
  def spacer
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ " 
    puts " "
  end
  def print_dishes(dishes)
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    puts "Here are some  #{@cuisine} dishes."
    dishes.each.with_index(1) do |dish ,index|
      puts "#{index}. #{dish.name}"
    end
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  end
  def print_dish(dish)
    puts dish.name
    puts dish.summary
  end
  
  
  def prompt_cuisine
    
    puts " "
    puts "Enter the type of Cuisine you are craving."
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    @cruisine = gets.strip.downcase
    API.get_list(@cuisine) if !Cuisine.find_by_cuisine(@cuisine)
    print_cuisines(Cuisine.find_by_cuisine(@cuisine).dishes)
  end
  
  def prompt_user
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    puts " "
    puts "Select a number to see summary of a dish from menu ; type 'menu' to see list of dishes again, 'cuisine' to select new cuisine , or 'exit' to exit."
    puts " "
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  end
  
end  
  
  
     
     
     
     
     
      
##input and output to user