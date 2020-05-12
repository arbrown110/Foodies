class Cli 

  def run 
    puts "  "
    puts "WELCOME TO FOODIES !!!!!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    puts "Enter the type of Cuisine you are craving."
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    @cruisine = gets.strip.downcase
    API.get_list(@cuisine)
    
    
    ##display a list of dishes to user
    print_cuisine (Dish.all)
    ## ask them to pick one
   
    prompt_user
    input = get.strip.downcase
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "

    while input != 'exit'
      if input ==  'menu'
        ##go forth and grab new type of food 
        dishes = Dish.select_by_cuisine(@cuisine)
        print_dish(dishes)
      elsif input.to_i > 0 && input.to_i < Dish.select_by_cuisine(@cuisine).length  #Dish
        dish = Dish.select_by_cuisine(@cuisine)[input.to_i - 1]
        #if they put dish go to summary for input
        API.getdishsum(dish) if !dish.summary
        print_dish(dish)
      
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
  def prompt_user
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
   
    puts "Select a number to see summary of a dish from menu ; type 'menu' to see list of dishes again, 'cuisine' to select new cuisine , or 'exit' to exit."
  end
  
end  
  
  
     
     
     
     
     
      
##input and output to user