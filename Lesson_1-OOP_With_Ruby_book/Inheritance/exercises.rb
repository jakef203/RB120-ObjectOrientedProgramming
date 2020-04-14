
# module Hauling
#   def haul_weight(weight)
#     puts "The vehicle is hauling #{weight} pounds on its trailer."
#   end
# end

# class Vehicle 
  
#   @@number_vehicles = 0
#   attr_accessor :color, :year, :model
#   def initialize(year, model, color)
#     self.year = year
#     self.model = model
#     self.color = color
#     @current_speed = 0
#     @@number_vehicles += 1
#   end

#   def self.total_vehicles
#     puts "The total number of vehicles is #{@@number_vehicles}."
#   end
  
#   def speed_up(number)
#     @current_speed += number
#     puts "You push the gas and accelerate #{number} mph."
#   end

#   def brake(number)
#     @current_speed -= number
#     puts "You push the brake and decelerate #{number} mph."
#   end

#   def current_speed
#     puts "You are now going #{@current_speed} mph."
#   end

#   def shut_down
#     @current_speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def to_s
#     "Your vehicle is a #{color} #{year} #{model}."
#   end

#   def self.gas_mileage(miles, gallons)
#     puts "Your gas mileage is #{miles / gallons} mpg."
#   end
# end

# class MyTruck < Vehicle
#   include Hauling
#   TRUCK_BED_SIZE = 10
#   NUMBER_OF_DOORS = 2
#   def truck_bed 
#     puts "The truck has a bed of size #{TRUCK_BED_SIZE}."
#   end

#   def to_s
#     "Your truck is a #{color} #{year} #{model}."
#   end
# end

# class MyCar < Vehicle
  
#   TURBO_BOOST = true
#   NUMBER_OF_DOORS = 2

#   def has_turbo?
#     puts (TURBO_BOOST ? "The Car has turbo." : "The car doesn't have turbo.")
#   end

#   def spray_paint(new_color)
#     self.color = new_color
#     puts "Changing the color of the car to #{new_color}."
#   end
  
#   def to_s
#     "Your car is a #{color} #{year} #{model}."
#   end

# end



# MyCar.gas_mileage(50, 16)
# lumina = MyCar.new(1997, 'chevy lumina', 'white')
# lumina.has_turbo?
# puts lumina.color
# puts lumina ## "puts" calls "to_s" automatically
# lumina.spray_paint('yellow')
# puts lumina.color
# puts lumina.year
# lumina.speed_up(20)
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.shut_down
# lumina.current_speed

# chevy = MyTruck.new(2000, 'dodge ram', 'blue')
# puts chevy
# chevy.truck_bed
# MyTruck.gas_mileage(351, 16)
# MyTruck.total_vehicles
# MyCar.total_vehicles
# Vehicle.total_vehicles
# chevy.haul_weight(2000)

# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts Vehicle.ancestors

## Their solution

# module Towable
#   def can_tow?(pounds)
#     pounds < 2000 ? true : false
#   end
# end

# class Vehicle
  
#   SECONDS_IN_DAY = 60 * 60 * 24
#   attr_accessor :color
#   attr_reader :model, :year
#   @@number_of_vehicles = 0

#   def self.number_of_vehicles
#     puts "This program has created #{@@number_of_vehicles} vehicles"
#   end

#   def initialize(year, model, color)
#     @year = year
#     @model = model
#     @color = color
#     @current_speed = 0
#     @@number_of_vehicles += 1
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You push the gas and accelerate #{number} mph."
#   end

#   def brake(number)
#     @current_speed -= number
#     puts "You push the brake and decelerate #{number} mph."
#   end

#   def current_speed
#     puts "You are now going #{@current_speed} mph."
#   end

#   def shut_down
#     @current_speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def self.gas_mileage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your new #{color} paint job looks great!"
#   end

#   def display_age
#     puts "The #{self.model} is #{age_of_car} years old."
#   end

#   private

#   def age_of_car
#     # purchase_date = Time.new(year_bought, month_bought, day_bought)
#     purchase_year = self.year
#     present_year = Time.new.year
#     present_year - purchase_year
#     # number_of_days_since_purchase = (present_date - purchase_date).to_f / SECONDS_IN_DAY
#     # age_years, age_days = number_of_days_since_purchase.divmod(365.25)
#     # [age_years, age_days]
#   end
# end

# class MyTruck < Vehicle
#   include Towable

#   NUMBER_OF_DOORS = 2

#   def to_s
#     "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
#   end
# end

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s
#     "My car is a #{self.color}, #{self.year}, #{self.model}!"
#   end
# end

# lumina = MyCar.new(1985, 'chevy lumina', 'white')
# lumina.speed_up(20)
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.shut_down
# MyCar.gas_mileage(13, 351)
# lumina.spray_paint("red")
# puts lumina
# lumina.display_age

class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def name
    @name
  end

  def name=(n)
    @name = n 
  end

  def grade=(g)
    @grade = g 
  end

  def better_grade_than?(other)
    grade > other.grade
  end

  # protected
  private
  def grade
    @grade
  end
end

joe = Student.new('Joe', 55)
ben = Student.new('Ben', 34)
# puts "Well done" if joe.better_grade_than?(ben)
puts joe.grade