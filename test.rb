




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


