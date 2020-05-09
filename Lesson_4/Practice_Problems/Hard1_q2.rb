
# module Fuel 
#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end


# class WheeledVehicle
#   include Fuel
#   attr_accessor :speed, :heading

#   def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
#     @tires = tire_array
#     @fuel_efficiency = km_traveled_per_liter
#     @fuel_capacity = liters_of_fuel_capacity
#   end

#   def tire_pressure(tire_index)
#     @tires[tire_index]
#   end

#   def inflate_tire(tire_index, pressure)
#     @tires[tire_index] = pressure
#   end

# end

# class Auto < WheeledVehicle
#   def initialize
#     # 4 tires are various tire pressures
#     super([30,30,32,32], 50, 25.0)
#   end
# end

# class Motorcycle < WheeledVehicle
#   def initialize
#     # 2 tires are various tire pressures
#     super([20,20], 80, 8.0)
#   end
# end

# class Catamaran
#   include Fuel
#   attr_reader :propeller_count, :hull_count
#   attr_accessor :speed, :heading

#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     @propeller_count = num_propellers
#     @hull_count = num_hulls 
#     @fuel_efficiency = km_traveled_per_liter
#     @fuel_capacity = liters_of_fuel_capacity
#   end
# end

module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
    def initialize
      # 4 tires are various tire pressures
      super([30,30,32,32], 50, 25.0)
    end
end
  
class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Catamaran
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

# Hard Question 3

class Motorboat < Catamaran 
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

# auto = Auto.new
# moto = Motorcycle.new
# cata = Catamaran.new(4, 2, 12, 12)
motorboat = Motorboat.new(13.0, 13.0)
p motorboat.propeller_count
p motorboat.hull_count
# p auto.range 
# p moto.range 
# p cata.range

