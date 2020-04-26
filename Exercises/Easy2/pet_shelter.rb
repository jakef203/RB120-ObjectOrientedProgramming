
# class Pet 
#   attr_reader :name, :animal
#   def initialize(animal, name)
#     @animal = animal 
#     @name = name 
#   end
# end

# class Owner 
#   @@owner_list = []
#   attr_accessor :number_of_pets
#   attr_reader :pet_list, :name
#   # attr_reader :name
#   # def owner_list=(owner)
#   #   @@owner_list << owner
#   # end
  
#   def initialize(name)
#     @name = name
#     @number_of_pets = 0 
#     @pet_list = []
#     @@owner_list << self
#   end

#   def self.owner_list
#     @@owner_list
#   end

#   def pet_list=(name)
#     pet_list << name
#   end
# end

# class Shelter 

#   def adopt(owner_name, pet_name)
#     owner_name.pet_list = pet_name 
#     owner_name.number_of_pets += 1
#   end

#   def print_adoptions

#     Owner.owner_list.each do |owner|
#       puts "#{owner.name} has adopted the following pets:"
#       owner.pet_list.each do |pet|
#         puts "a #{pet.animal} named #{pet.name}"
#       end
#       puts "\n"
#     end
#   end
# end

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

class Pet 
  attr_reader :animal, :name 

  def initialize(animal, name)
    @animal = animal
    @name = name 
  end

  def to_s
    "a #{animal} named #{name}"
  end
end 

class Owner 
  attr_reader :pets, :name
  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end

end

class Shelter
  attr_reader :owners, :available_animals
  def initialize(available_animals = [])
    @available_animals = available_animals
    @owners = {}
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    owners[owner.name] ||= owner
    @available_animals.delete(pet)
  end

  def print_adoptions
    puts "The Animal Shelter has the following unadopted pets:"
    puts @available_animals
    puts
    owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end

end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
frostie      = Pet.new('dog', 'Frostie')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')
pets = [butterscotch, pudding, darwin, kennedy, sweetie, molly, chester, frostie, 
        asta, laddie, fluffy, kat, ben, chatterbox, bluebell]
shelter = Shelter.new(pets)

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
jfeigum = Owner.new('J Feigum')

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(jfeigum, frostie)
shelter.adopt(jfeigum, fluffy)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{jfeigum.name} has #{jfeigum.number_of_pets} adopted pets."




  