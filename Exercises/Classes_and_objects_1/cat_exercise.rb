
class Cat
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi.  My name is #{name}."
  end

  def name=(n)
    @name = n + "Sun" 
  end
end

kitty = Cat.new("Sophie")
kitty.greeting
kitty.name = "Luna"
kitty.greeting