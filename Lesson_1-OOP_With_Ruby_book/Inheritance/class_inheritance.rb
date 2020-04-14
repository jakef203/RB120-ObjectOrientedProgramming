
class Animal
  def speak
    "Hello!"
  end
end

# class GoodDog < Animal #GoodDog is a subclass that is inheriting behavior from Animal, a superclass
# end                    #All methods in Animal class are available to GoodDog class
class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new
puts sparky.speak
puts paws.speak