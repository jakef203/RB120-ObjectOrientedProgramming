
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
end


class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
bud = Bulldog.new("Bud")             # assume Bulldog class from previous assignment

bob.pet = bud
puts bob.pet
puts bob.pet.speak
puts bob.pet.fetch