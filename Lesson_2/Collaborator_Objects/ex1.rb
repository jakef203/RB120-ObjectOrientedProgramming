
class Bulldog

  def initialize(name)
    @name = name 
  end

  def to_s
    "Hi I'm #{@name} the dog."
  end

  def speak
    "speaking"
  end

  def fetch
    "fetching"
  end

  def jump
    "jumping"
  end
end

# class Person
#   attr_accessor :name, :pet

#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Robert")
# bud = Bulldog.new             # assume Bulldog class from previous assignment

# bob.pet = bud

# bob.pet                       # => #<Bulldog:0x007fd8399eb920>
# bob.pet.class
# bob.pet.speak                 # => "bark!"
# bob.pet.fetch

## We can have several pets, which are separate objects, and add them to an array
#  that is stored in @pets instance variable of Person

class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Cat

  def initialize(name)
    @name = name 
  end

  def to_s
    "Hi I'm #{@name} the cat."
  end

  def speak
    "speaking"
  end

  def jump
    "jumping"
  end

end

bob = Person.new("Robert")

kitty = Cat.new('Paws')
bud = Bulldog.new('Chuck')

bob.pets << kitty
bob.pets << bud

p bob.pets

bob.pets.each do |pet|
  p pet.jump
end


