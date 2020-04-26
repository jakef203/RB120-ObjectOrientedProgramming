# Part 1
class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
p cat1.color  #=> method lookup is Cat then Animal
p Cat.ancestors

# Part 2

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color
## Method lookup is Cat, Animal, Object, Kernel, BasicObject
# Here, Ruby searches for the #color method in every class and module in the search path. 
# Since the method isn't anywhere, the answer includes every class and module in the search path.

# Part 3

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color
## Lookup will be Bird, Flyable, Animal