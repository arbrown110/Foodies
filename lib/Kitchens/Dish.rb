class Dish

  attr_accessor :name, :dish_id , :cuisine , :summary

  @@all = [ ]
  
  def initialize (name:, dish_id:, cuisine:)
    @name = name
    @dish_id = drink_id
    @cuisine = cuisine
    @@all << self 
  end
  
  def self.all
    @@all
  end
  def self.find_by_cuisine(cuisine)
    self.all.select {|dish| dish.cuisine == cuisine}
end


## responsible for making dishes