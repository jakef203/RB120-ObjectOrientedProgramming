
module Eatable
  def eat 
    "I'm eating"
  end
end

module Walkable
  def walk 
    "I'm walking"
  end
end

module Swimmable
  def swim 
    "I'm swimming"
  end
end

module Climbable
  def climb 
    "I'm climbing"
  end
end

class Animal 
  include Walkable 
  include Eatable

  def speak
    "I'm an animal, and I speak!"
  end
end

class GoodDog < Animal 
  include Swimmable
  include Climbable 
end

puts GoodDog.ancestors
# fido = Animal.new
# p fido.swim
