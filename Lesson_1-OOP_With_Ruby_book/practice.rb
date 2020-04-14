
# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def name=(n)
#     @name = n
#   end

#   def speak
#     "#{@name} says Arf!"
#   end
# end

# class GoodDog  # Using attr_accessor does same thing here as code above
#   attr_accessor :name, :date
  
#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{name} says arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# sparky.date = "11-11"
# p sparky.date
# p sparky.speak
# p sparky.name
# sparky.name = "Spartacus"
# p sparky.name
# p sparky.speak

# fido = GoodDog.new("Fido")
# p fido.speak
# p sparky.get_name
# p fido.get_name