
# Part 1

# class Cat
#   attr_accessor :name 

#   def initialize(name)
#     @name = name 
#   end

#   def identify
#     self
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.identify
# p kitty

# Part 2

class Cat 
  attr_reader :name 

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty
