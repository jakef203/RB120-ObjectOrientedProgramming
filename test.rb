
# class ValidateAgeError < StandardError; end


# def validate_age(age, num)
#   raise ValidateAgeError, "invalid age" unless (0..105).include?(age)
#   # raise ZeroDivisionError, "divide by zero" unless num != 0
#   5 / 0
# end


# begin
#   validate_age(106, 0)
# rescue ValidateAgeError => e
#   puts e.message              #=> "invalid age"
# rescue ZeroDivisionError => f 
#   puts f.message
# end

# def c_to_f(degrees_c:, h:)
#   ((9.0/5) * degrees_c) + 32 + h
# end

# p c_to_f(degrees_c: 100, h: 10)

# class Man
#   # attr_reader :name 
#   # attr_writer :name

#   def initialize(name)
#     @name = name
#   end

#   def speak 
#     puts "Hello there"
#   end

#   def name=(n)
#     @name = n
#   end

#   def set_name(name)
#     @name = name
#   end

#   def say_name
#     puts "My name is #{@name}"
#   end
# end

# class Dog
#   attr_reader :name 
#   # attr_writer :name

#   def initialize(name)
#     @name = name
#   end

#   def speak 
#     puts "Woof"
#   end

#   # def name 
#   #   @name
#   # end

#   def name=(n)
#     @name = n
#   end

#   def set_name(name)
#     @name = name
#   end

#   def say_name
#     puts "My name is #{name}"
#   end
# end

# man = Man.new("John")
# dog = Dog.new("Bud")
# # dog.name = "Lou"
# dog.set_name("Jumper")
# # dog.name = "Lou"
# puts dog.name
# arr = [man, dog]
# arr.each {|thing| thing.speak }



# man = Man.new("Joe")
# # puts man.@name 
# a = man.say_name
# p a
# # man.set_name("Jerry")
# man.name = 'Jerry'
# # puts man.@name 
# man.say_name

# class Animal
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# class GoodDog < Animal
#   def initialize(color)
#     super
#     @color = color
#   end
# end

# class BadDog < Animal 
#   def initialize(color, name)
#     super(name)
#     @color = color 
#   end
# end

# bruno = GoodDog.new("brown")  
# p bruno 
# baddo = BadDog.new("white", "Lou")
# p baddo

# module Mod 
#   class Dog 
#     def speak(word)
#       p "#{word}"
#     end
#   end

#   class Cat 
#     def say_name(name)
#       p "#{name}"
#     end
#   end
# end

# dog = Mod::Dog.new
# dog.speak("Arf")
# cat = Mod::Cat.new 
# cat.say_name("Larry")

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end

#   def public_disclosure
#     "#{self.name} in human years is #{self.human_years}"
#   end

#   private

#   def human_years
#     age * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# p sparky.public_disclosure

# module Towable 
#   def tow 
#     puts "I'm towing"
#   end
# end
# class Vehicle
#   @@number_of_vehicles = 0

#   def self.number_of_vehicles
#     puts "This program has created #{@@number_of_vehicles} vehicles"
#   end

#   def initialize
#     @@number_of_vehicles += 1
#   end

#   def self.gas_mileage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end
# end

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4
#   #code omitted for brevity...
# end

# class MyTruck < Vehicle
#   include Towable
#   NUMBER_OF_DOORS = 2
# end

# Vehicle.number_of_vehicles
# MyCar.number_of_vehicles
# MyTruck.number_of_vehicles
# car = MyCar.new 
# MyTruck.number_of_vehicles
# truck = MyTruck.new 
# Vehicle.number_of_vehicles
# MyCar.number_of_vehicles
# MyTruck.number_of_vehicles
# truck.tow
# puts Vehicle.ancestors
# puts MyTruck.ancestors

# class Student
#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def better_grade_than?(other_student)
#     grade > other_student.grade
#   end

#   protected
#   # private

#   def grade
#     @grade
#   end
# end

# joe = Student.new("Joe", 90)
# bob = Student.new("Bob", 84)
# puts "Well done!" if joe.better_grade_than?(bob)
# puts joe.grade


# class Person
#   attr_accessor :name

#   def ==(other)
#     name == other.name     # relying on String#== here
#   end
# end

# bob = Person.new
# bob.name = [1, 2, 3]

# bob2 = Person.new
# bob2.name = [1, 2, 3]
# bob3 = bob
# p bob == bob3 
# p bob == bob2


