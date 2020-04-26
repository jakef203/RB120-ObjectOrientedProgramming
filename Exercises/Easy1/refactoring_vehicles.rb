
class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    puts "undefined instance method wheels for #{self.class} class"
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle

  def wheels
    4
  end
end

class Motorcycle < Vehicle

  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

truck = Truck.new('chevy', 'bruiser', 2000)
puts truck
p truck.wheels
p truck.payload
car = Car.new('Toyota', 'corolla')
puts car
p car.wheels
motor = Motorcycle.new('Kawasaki', 'ninja')
puts motor 
p motor.wheels