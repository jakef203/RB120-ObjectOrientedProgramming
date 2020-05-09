
module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Seacraft
  include Moveable

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
    @propeller_count = num_propellers
    @hull_count = num_hulls

    # ... other code to track catamaran-specific data omitted ...
  end
end


class Catamaran < Seacraft
end

class Motorboat < Seacraft 
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

cata = Catamaran.new(2, 3, 14.0, 14.0)
motor = Motorboat.new(15.0, 15.0)
p cata 
p cata.range 
p motor
p motor.range