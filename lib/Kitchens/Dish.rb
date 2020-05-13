class Dish

  attr_accessor :name, :dish_id , :cuisine , :summary , :similar

  @@all = [ ]
  
  def initialize (name:, dish_id:, cuisine:)
    @name = name
    @dish_id = dish_id
    @cuisine = cuisine
    @similar = similar
    @@all << self 
  end
  
  def self.all
    @@all
  end
  def self.find_by_cuisine(cuisine)
    self.all.select {|dish| dish.cuisine == cuisine}
end


## responsible for making dishes