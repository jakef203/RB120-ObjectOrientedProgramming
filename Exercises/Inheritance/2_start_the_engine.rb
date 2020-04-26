# #  Part 1
# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year 
#   end
# end

# class Truck < Vehicle

#   # attr_reader :tru  # For option 2

#   def initialize(year) ##Option 1 
#     super  ##All arguments in creating object on line 30 are sent to super when no arguments here
#     start_engine 
#   end 

  # def initialize(year, tru) ##Option 2
  #   super(year) #Only year on Line 30 is sent to Vehicle initialize
  #   @tru = tru
  #   start_engine 
  # end 

#   def start_engine 
#     puts 'Ready to go!'
#   end
# end

# truck1 = Truck.new(1994)  ## Option 1, super
# # truck1 = Truck.new(1994, 'tru') ## Option 2, 1994 is sent to by super in Truck initialize to superclass initialize, 'tru' is sent to subclass initialize
# puts truck1.year
# # puts truck1.tru

# Part 2

class Vehicle
  def start_engine
    "Ready to go!"
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + " Drive #{speed} please!"  ## If you just put 'super' it will send speed argument to Vehicle start_engine
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')