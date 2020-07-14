
class Animal

  def self.info 
    "I am a #{self}"
  end

  def rex 
    self 
  end

end

class Pet < Animal

  attr_accessor :nickname
  def initialize(nickname)
    @nickname = nickname 
  end 

  # def self.info 
  #   "I am a PET"
  # end
  
  def change_info(new_name)
    self.nickname = new_name 
  end

  def introduce
    "#{self.class.info}"
  end

  def to_s
    "#{nickname} the #{self.class}ie"
  end

end

class Dog < Pet

  def introduce
    "#{self.class.info} and my name is #{self}. " \
    "Woof woof!"
  end

  # def to_s
  #   "#{nickname} the doggie!"
  # end

  # def self.info 
  #   "I am in Dog"
  # end

end

rex = Dog.new("Rex")
# puts Dog.info
puts rex.introduce
pet = Pet.new("Petty")
puts pet.introduce