
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

car = Car.new
truck = Truck.new
truck1 = Truck.new
car.go_slow 
car.go_fast
truck.go_very_slow
truck.go_fast
p car.class
p truck.class
p truck1.class