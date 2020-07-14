## Ex. 1

# class Cat 
#   def self.generic_greeting 
#     puts "Hello! I'm a cat!"
#   end
# end
# Cat.generic_greeting

## Ex. 2

# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(name)
#     self.name = name 
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name

## Ex. 3

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

## Ex. 4

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def self.generic_greeting
#     puts "Meow, I'm a cat!"
#   end

#   def personal_greeting 
#     puts "Meow, my name is #{name}."
#   end
# end

# kitty = Cat.new('Sophie')

# Cat.generic_greeting
# kitty.personal_greeting

class Cat 
  @@total = 0
  def initialize
    @@total += 1 
  end

  def self.total 
    puts @@total 
  end 
end
kitty1 = Cat.new 
kitty2 = Cat.new
Cat.total

