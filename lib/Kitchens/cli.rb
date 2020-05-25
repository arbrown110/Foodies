class CLI

  def run
    puts "  "
    puts "WELCOME TO FOODIES !!!!!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "

    prompt_cuisine
    prompt_user
    input = gets.strip.downcase

    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "

    while input != 'exit'

      if input == 'menu'

      dishes = Cuisine.find_by_cuisine(@cuisine).dishes

      print_dishes(dishes)

    elsif input.to_i > 0 && input.to_i <= Cuisine.find_by_cuisine(@cuisine).dishes.length

        dish = Cuisine.find_by_cuisine(@cuisine).dishes[input.to_i - 1]
        #if they put dish go to summary for input
        API.getdishsum(dish) if !dish.sum

        print_dish(dish)


      elsif input == 'cuisines'
        prompt_cuisine
        #binding.pry
        #if they pick different dish show that summary
      else
        puts "what number is that? Let's take another look ."
      end
       prompt_user
       input = gets.strip.downcase
    end
    puts " "
    puts "I don't know about you but I'm full ! See you next time."
  end

  def print_dishes(dishes)
    sorted_dishes = Dishes.sort_by_length
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    puts "Here are some  #{@cuisine} dishes."
    sorted_dishes.each.with_index(1) do |dish ,index|
      puts "#{index}. #{dish.name}  #{dish.dish_id}"
    end
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  end
  def print_dish(dish)

    puts dish.name
    puts "    "
    puts dish.sum
  end


  def prompt_cuisine

    puts " "
    puts "Enter the type of Cuisine you are craving."
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    @cuisine = gets.strip.downcase
    API.get_dishes(@cuisine) if !Cuisine.find_by_cuisine(@cuisine)
    print_dishes(Cuisine.find_by_cuisine(@cuisine).dishes)
  end

  def prompt_user
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
    puts " "
    puts "Select a number to see summary of a dish from menu ; type 'menu' to see list of dishes again, 'cuisines' to select new cuisine , or 'exit' to exit."
    puts " "
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
  end
end











    ##input and output to user
