
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n 
    self.height = h 
    self.weight = w 
  end

  def self.name(n) 
    puts "Hi this is #{n}"
  end
  
  def change_info(n, h, w)
    self.name = n   ## self inside an instance method references the instance (object) that called the method
    self.height = h ## self.height here is the same as sparky.height outside the class
    self.weight = w 
  end

  ## If you don't have attr_accessor(Line3), and only attr_writer, calling 'self.name' is same as 'name' and will throw error
  def info 
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  # def what_is_self
  #   self  ## This will refer to instance object that calls what_is_self, since it's inside instance method
  # end

  # puts self ## Self outside of an instance method references the class and can be used to define class methods

end

GoodDog.name('lou')
sparky = GoodDog.new("Sparky", "12 inches", "10 lbs")
# p sparky.what_is_self 
p sparky.info