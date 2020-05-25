class Dish

  attr_accessor :name, :dish_id , :cuisine , :sum

  @@all = [ ]

  def initialize (name:, dish_id:, cuisine:, sum:)
    @name = name
    @dish_id = dish_id
    @cuisine = cuisine
    @sum = sum
    @@all << self
  end

  def self.all
    @@all
  end
  def self.find_by_cuisine(cuisine)
    self.all.select {|dish| dish.cuisine == cuisine}
  end
  
  def self.sort_by_length
    self.all.sort_by{|dish| [dish.name.length]}
  end
end


## responsible for making dishes
