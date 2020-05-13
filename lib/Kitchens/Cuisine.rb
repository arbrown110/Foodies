class Cuisine
  attr_accessor :name, :dishes 
  
  
  @@all= []
  
  def initialize(name)
    @name = name
    @dishes = [] ## will contain objects
    @@all << self
    
  end
  
  def self.all
    @@all
  end
  
  def self.find_by_cuisine(cuisine)
    self.all.find {|cu_piece| cu_piece.name == cuisine}
  end
  
end  