

# module Maintenance
#   WHEELS = 6
#   def change_tires
#     "Changing #{Vehicle::WHEELS} tires."
#   end
# end

# class Vehicle
#   WHEELS = 4
# end

# class Car < Vehicle
#   include Maintenance
# end

# a_car = Car.new
# p a_car.change_tires

# class Animal
#   @@total_animals = 0

#   def self.total_animals
#     @@total_animals
#   end

#   def initialize
#     @@total_animals += 1
#   end
# end

# class Dog < Animal
#   def total_animals
#     @@total_animals
#   end
# end

# p Animal.total_animals
# spike = Dog.new
# p spike.total_animals 
# p Animal.total_animals


# module Swim
#   attr_reader :can_swim
#   def enable_swimming
#     @can_swim = true
#   end
# end

# class Dog
#   include Swim

#   def swim
#     "swimming!" if @can_swim
#   end
# end

# teddy = Dog.new
# p teddy.can_swim
# p teddy.swim 
# teddy.enable_swimming
# p teddy.can_swim
# p teddy.swim

# st = "MrBe "
# reg = /\w/
# reg2 = /\S/
# p (st =~ reg && st =~ reg2)
# p reg.match(st)

# class Person
#   def get_name
#     @name                     # the @name instance variable is not initialized anywhere
#   end
# end

# bob = Person.new
# p bob.get_name  
# s = ['h', 'e', 'l', 'l', 'o']
# puts "S is #{s.object_id}"
# (0...s.size).each { |x| puts s[x].object_id }
# s[0] = 'y'
# puts "S is #{s.object_id}"
# (0...s.size).each { |x| puts s[x].object_id }



# class Student
#   attr_accessor :grade

#   def initialize(name, grade=5)
#     @name = name
#     # @grade = grade
#   end
# end

# ade = Student.new('Adewale')
# p ade # => #<Student:0x00000002a88ef8 @name="Adewale"> ## Won't have 'grade' because it's not initialized
# p ade.grade # => Will return 'nil' if has getter method (accessor or reader) but not initialized


# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{name} is speaking."
#   end
# end

# class Knight < Character
#   def name
#     "Sir " + super
#   end
# end

# class Man < Character
#   def name
#     "Mr. " + super
#   end
# end

# class Woman < Character
#   def name
#     "Mrs. " + super
#   end
# end

# class Thief < Character

#   def speak
#     "#{name} is whispering"
#   end
# end

# sneak = Thief.new("Sneak")
# puts sneak.name # => "Sneak"
# puts sneak.speak # => "Sneak is whispering..."

# sir_gallant = Knight.new("Gallant")
# mr_bill = Man.new("Bill")
# mrs_smith = Woman.new("Smith")
# puts mr_bill.name
# puts mr_bill.speak
# puts mrs_smith.name 
# puts mrs_smith.speak
# puts sir_gallant.name # => "Sir Gallant"
# puts sir_gallant.speak # => "Sir Gallant is speaking."

# class Dog
#   attr_reader :value
#   def initialize
#     @value = 'dogeeeee'
#   end

#   def to_s
#     @value
#   end
# end

# class Human
#   attr_reader :value
#   def initialize
#     @value = 'huawe'
#   end

#   def to_s
#     @value
#   end
# end

# human = Human.new
# dog = Dog.new
# arr = [human, dog]

# a = (arr.max_by { |x| x.value.length }).to_s
# p a
# names = arr.map { |x| x.value }
# puts names