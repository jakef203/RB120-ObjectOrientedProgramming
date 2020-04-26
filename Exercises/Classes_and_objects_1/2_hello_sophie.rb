
# Hello, Sophie! (Part 1)

# class Cat

#   def initialize(name)
#     @name = name
#     puts "Hello! My name is #{@name}!"
#   end

# end

# kitty = Cat.new('Sophie')

# Hello, Sophie! (Part 2)

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet