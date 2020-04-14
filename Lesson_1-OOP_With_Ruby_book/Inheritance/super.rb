#Ex 1

# class Animal
#   def speak 
#     "Hello!"
#   end
# end

# class GoodDog < Animal 
#   def speak
#     super + " from GoodDog class"
#   end
# end

# sparky = GoodDog.new
# puts sparky.speak

# Ex 2

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name 
  end
end

class GoodDog < Animal 
  # attr_accessor :color
  
  def initialize(color)
    super
    @color = color 
  end
end

class BadDog < Animal
  attr_accessor :age, :name
  
  def initialize(age, name)
    super(name)
    # @name = name
    @age = age
  end
end
baddo = BadDog.new(2, "bear")
bruno = GoodDog.new("brown")
# p bruno.color
# p bruno.name
p baddo
