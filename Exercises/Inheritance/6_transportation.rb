
module Transportation
  class Vehicle
    attr_reader :year, :model, :color
  
    def initialize(year, model, color)
      @year = year
      @model = model
      @color = color
    end
  end

  class Truck < Vehicle 
    def to_s
      "I have a #{color} #{year} #{model}!"
    end
  end

  class Car < Vehicle
  end
end

truck = Transportation::Truck.new(1985, 'chevy', 'orange')
car = Transportation::Car.new(2000, 'ford', 'black')
puts truck
p car.year
p car.color
