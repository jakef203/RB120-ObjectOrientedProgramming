
class GoodDog

  @@number_of_dogs = 0

  def initialize 
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new 
dog2 = GoodDog.new
puts GoodDog.total_number_of_dogs
# class GoodDog
#   attr_accessor :name, :height, :weight

#   def self.what_am_i
#     puts "I'm a GoodDog class!"
#   end
  
#   def initialize(n, h, w)
#     @name = n 
#     @height = h 
#     @weight = w 
#   end

#   def speak
#     "#{name} says arf!"
#   end

#   def other_plus_info
#     puts "hi there"
#     puts info
#   end

#   def change_info(n, h, w)
#     self.name = n 
#     self.height = h 
#     self.weight = w 
#   end

#   def info
#     "#{name} weighs #{weight} and is #{height} tall."
#   end
# end

# GoodDog.what_am_i
# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.info
# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info
# sparky.other_plus_info