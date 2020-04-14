
# class MyCar
#   attr_accessor :year, :color, :model, :car_on, :speed
  
#   def initialize(year, color, model)
#     @year = year
#     @color = color 
#     @model = model
#     @speed = 0
#     @car_on = false 
#   end

#   def accelerate(new_speed)
#     if car_on == false
#       puts "Must turn on car first."
#     elsif new_speed <= speed
#       puts "Need a speed greater than #{speed}"
#     else
#       puts "Car speeding up to #{new_speed} mph."
#       self.speed = new_speed
#     end
#   end

#   def brake(new_speed)
#     if car_on == false
#       puts "Must turn on car first." 
#     elsif new_speed >= speed
#       puts "Need a speed less than #{speed}"
#     elsif new_speed < 0 
#       puts "Can't brake to below 0"
#     else
#       puts "Car braking to #{new_speed} mph."
#       self.speed = new_speed
#     end
#   end

#   def turn_on_off
#     if speed > 0 
#       puts "Can't turn car off if speed is greater than 0"
#     else
#       puts (car_on ? "Turning car off" : "Turning car on")
#       self.car_on = !car_on
#     end
#   end
# end

# car = MyCar.new('1998', 'red', 'corvette')
# car.accelerate(-1)
# car.brake(10)
# car.turn_on_off
# # car.turn_on_off
# car.accelerate(5)
# puts "Current speed is #{car.speed}"
# car.accelerate(10)
# car.turn_on_off
# puts "Current speed is #{car.speed}"
# car.brake(0)
# car.turn_on_off
# puts "Current speed is #{car.speed}"
# p "#{car.year}, #{car.model}, #{car.color}"

class MyCar

  attr_accessor :color
  attr_reader :year
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
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
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
puts lumina.color
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

