
class MyCar

  attr_accessor :color, :year, :model
  def initialize(year, model, color)
    self.year = year
    self.model = model
    self.color = color
    @current_speed = 0
  end
  
  def spray_paint(new_color)
    self.color = new_color
    puts "Changing the color of the car to #{new_color}."
  end
  
  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def to_s
    "Your car is a #{color} #{year} #{model}."
  end

  def self.gas_mileage(miles, gallons)
    puts "Your gas mileage is #{miles / gallons} mpg."
  end
end



MyCar.gas_mileage(50, 16)
lumina = MyCar.new(1997, 'chevy lumina', 'white')
puts lumina.color
puts lumina ## "puts" calls "to_s" automatically
lumina.spray_paint('yellow')
puts lumina.color
puts lumina.year
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "bob"
puts bob.name
