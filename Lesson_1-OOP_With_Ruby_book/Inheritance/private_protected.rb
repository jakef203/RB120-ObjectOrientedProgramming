
# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a 
#   end

#   def public_disclosure
#     "#{self.name} in human years is #{human_years}"
#   end

#   private

#   def human_years
#     age * DOG_YEARS
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# p sparky.public_disclosure

## Protected method

class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end

fido = Animal.new
p fido.a_public_method 
# p fido.a_protected_method
p fido.instance_of?(Animal)
p Animal.superclass

