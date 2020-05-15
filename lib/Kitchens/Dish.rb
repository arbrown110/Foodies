class Dish

  attr_accessor :name, :dish_id , :cuisine , :summary 

  @@all = [ ]
  
  def initialize (name:, dish_id:, cuisine:)
    @name = name
    @dish_id = dish_id
    @cuisine = cuisine
    @summary = summary
    @@all << self 
  end
  
  def self.all
    @@all
  end
  def self.find_by_cuisine(cuisine)
    self.all.select {|dish| dish.cuisine == cuisine}
  end
end


## responsible for making dishes